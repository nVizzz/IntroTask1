terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.3.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name        = var.project_name
      Environment = "Development"
      Terraform   = true
      Project     = "CloudX"
      Owner       = "Roman_Izvozchikov"
    }
  }
}

module "iam" {
  name                    = var.project_name
  source                  = "./modules/iam"
  policy_path             = var.policy_path
  assume_role_policy_path = var.assume_role_policy_path
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source          = "./modules/subnet"
  azs             = var.azs
  vpc_id          = module.vpc.vpc_id
  subnets_public  = var.subnets_public
  subnets_private = var.subnets_private
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat_gw" {
  source         = "./modules/nat_gw"
  subnets_public = module.subnet.subnets_public
  vpc_id         = module.vpc.vpc_id
  igw_id         = module.igw.igw_id
}

module "route_table" {
  source             = "./modules/route_table"
  availability_zones = module.subnet.availability_zones
  nat_gw             = module.nat_gw.nat_gw
  subnets_public     = module.subnet.subnets_public
  subnets_private    = module.subnet.subnets_private
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
}

module "sg" {
  source              = "./modules/sg"
  public_inbound      = var.public_inbound
  public_outbound     = var.public_outbound
  private_inbound     = var.private_inbound
  private_outbound    = var.private_outbound
  private_db_inbound  = var.private_db_inbound
  private_db_outbound = var.private_db_outbound
  vpc_id              = module.vpc.vpc_id
}

module "key_pair" {
  source  = "./modules/key_pair"
  name    = var.project_name
  ssh_key = var.ssh_key
}

module "launch_template" {
  source                               = "./modules/launch_template"
  associate_public_ip_address          = var.associate_public_ip_address
  name                                 = var.project_name
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_profile                     = module.iam.instance_profile
  image_id                             = var.image_id
  instance_type                        = var.instance_type
  key_pair                             = module.key_pair.key_pair
  common_tags                          = var.common_tags
  security_group                       = module.sg.sg_private
  user_data                            = var.user_data
}

module "asg" {
  source              = "./modules/asg"
  name                = var.project_name
  max_size            = var.max_size
  min_size            = var.min_size
  subnets_private     = module.subnet.subnets_private_ec2
  launch_template     = module.launch_template.launch_template
  lb_target_group_arn = module.lb.lb_target_group_arn
  tags                = var.common_tags
}

module "lb" {
  source                     = "./modules/lb"
  name                       = var.project_name
  lb_internal                = var.lb_internal
  lb_type                    = var.lb_type
  enable_deletion_protection = var.enable_deletion_protection
  sg_lb                      = module.sg.sg_public
  subnets_public             = module.subnet.subnets_public
  lb_listener_port           = var.lb_listener_port
  lb_listener_protocol       = var.lb_listener_protocol
  target_group_port          = var.target_group_port
  target_group_protocol      = var.target_group_protocol
  vpc_id                     = module.vpc.vpc_id
}

module "db" {
  source                  = "./modules/db"
  azs                     = var.azs
  name                    = var.project_name
  availability_zones      = module.subnet.availability_zones
  backup_retention_period = var.backup_retention_period
  subnets_private_db      = module.subnet.subnets_private_db
  sg_private_db           = module.sg.sg_private_db
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  multi_az                = var.multi_az
  username                = var.username
  db_password             = var.db_password
  parameter_group_name    = var.parameter_group_name
  skip_final_snapshot     = var.skip_final_snapshot
  storage_type            = var.storage_type
}
