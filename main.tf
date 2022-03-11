terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source                  = "./modules/iam"
  name                    = "cloudx"
  policy_path             = "files/ghost_app_policy.json"
  assume_role_policy_path = "files/ghost_app_role_policy.json"
  tags_common = var.tags_common
}

module "vpc" {
  source = "./modules/vpc"
  tags_common = var.tags_common
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  tags_common = var.tags_common
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  tags_common = var.tags_common
}

module "nat_gw" {
  source  = "./modules/nat_gw"
  subnets = module.subnet.subnets_public
  igw_id  = module.igw.igw_id
  vpc_id  = module.vpc.vpc_id
  tags_common = var.tags_common
}

module "route_table" {
  source             = "./modules/route_table"
  nat_gw             = module.nat_gw.nat_gw
  subnets_public     = module.subnet.subnets_public
  subnets_private    = module.subnet.subnets_private
  subnets_private_db = module.subnet.subnets_private_db
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  tags_common = var.tags_common
}

module "sg" {
  source = "./modules/sg"
  public_inbound = {
    http = {
      protocol   = "tcp"
      port       = 80
      cidr_block = "0.0.0.0/0"
    }
  }
  private_inbound = {
    http = {
      protocol   = "tcp"
      port       = 8080
      cidr_block = "0.0.0.0/0"
    }
  }
  private_db_inbound = {
    http = {
      protocol   = "tcp"
      port       = 8081
      cidr_block = "0.0.0.0/0"
    }
  }
  vpc_id = module.vpc.vpc_id
  tags_common = var.tags_common
}

module "key_pair" {
  source  = "./modules/key_pair"
  name    = "cloudx"
  ssh_key = var.ssh_key
  tags_common = var.tags_common
}

module "ssm_parameter" {
  source = "./modules/ssm_parameter"
  name = "/cloudx/dbpassw"
  name_tag = "cloudx"
  db_password = var.db_password
  tags_common = var.tags_common
}

module "launch_template" {
  source = "./modules/launch_template"
  name = "cloudx"
  instance_profile = module.iam.instance_profile
  image_id = "ami-033b95fb8079dc481"
  instance_type = "t2.micro"
  key_pair = module.key_pair.key_pair
  security_group = module.sg.sg_private
  user_data = "files/user_data.sh"
  tags_common = var.tags_common
}

module "asg" {
  source = "./modules/asg"
  name = "cloudx"
  max_size = 6
  min_size = 3
  subnets_private = module.subnet.subnets_private
  launch_template = module.launch_template.launch_template
  subnets_private_set = module.subnet.subnets_private_set
  lb_target_group_arn = module.lb.lb_target_group_arn
  tags = var.tags_common
}

module "lb" {
  source = "./modules/lb"
  lb_name = "cloudx"
  tags_common = var.tags_common
  sg_lb = module.sg.sg_public
  subnets_public = module.subnet.subnets_public
  lb_listener_name = "cloudx"
  lb_listener_port = 80
  lb_listener_protocol = "HTTP"
  target_group_name = "cloudx"
  target_group_port = 80
  target_group_protocol = "HTTP"
  vpc_id = module.vpc.vpc_id
}

module "db" {
  source = "./modules/db"
  name = "cloudx"
  availability_zone_primary = "us-east-1a"
  availability_zone_replica1 = "us-east-1b"
  availability_zone_replica2 = "us-east-1c"
  backup_retention_period = 20
  subnets_private_db = toset([for subnet in module.subnet.subnets_private_db: subnet.subnet])
  sg_private_db = module.sg.sg_private_db
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  username = "admin"
  db_password = var.db_password
  parameter_group_name = "default.mysql8.0"
  storage_type = "gp2"
  tags_common = var.tags_common
}
