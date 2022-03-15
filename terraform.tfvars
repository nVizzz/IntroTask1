region       = "us-east-1"
project_name = "cloudx"
azs          = 3

common_tags = {
  Environment = "Development"
  Terraform   = true
  Project     = "CloudX"
  Owner       = "Roman_Izvozchikov"
}

#VPC variables:

vpc_cidr             = "10.10.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true

#IAM variables:

policy_path             = "files/ghost_app_policy.json"
assume_role_policy_path = "files/ghost_app_role_policy.json"

#Subnet variables:

subnets_public  = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
subnets_private = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24", "10.10.31.0/24", "10.10.32.0/24", "10.10.33.0/24"]

#Security group variables:

public_inbound = {
  http = {
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "0.0.0.0/0"
  }
}
public_outbound = {
  all = {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }
}
private_inbound = {
  http = {
    protocol   = "tcp"
    from_port  = 8080
    to_port    = 8080
    cidr_block = "0.0.0.0/0"
  }
}
private_outbound = {
  all = {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }
}
private_db_inbound = {
  http = {
    protocol   = "tcp"
    from_port  = 8081
    to_port    = 8081
    cidr_block = "0.0.0.0/0"
  }
}
private_db_outbound = {
  all = {
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }
}

#Launch template variables:

associate_public_ip_address          = true
image_id                             = "ami-033b95fb8079dc481"
instance_initiated_shutdown_behavior = "terminate"
instance_type                        = "t2.micro"
user_data                            = "files/user_data.sh"

#Auto scaling group variables:

max_size = 6
min_size = 3

#Load balancer variables:

lb_internal                = false
lb_type                    = "application"
enable_deletion_protection = false
lb_listener_port           = 80
lb_listener_protocol       = "HTTP"
target_group_port          = 80
target_group_protocol      = "HTTP"

#DB variables:

allocated_storage       = 20
backup_retention_period = 10
engine                  = "mysql"
engine_version          = "8.0"
instance_class          = "db.t2.micro"
multi_az                = false
parameter_group_name    = "default.mysql8.0"
skip_final_snapshot     = true
storage_type            = "gp2"
username                = "admin"
