#VPC outputs:

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

#IAM outputs:

output "aws_iam_role" {
  description = "ID of the instance_profile"
  value       = module.iam.aws_iam_role
}

output "instance_profile" {
  description = "ID of the instance_profile"
  value       = module.iam.instance_profile
}

#Subnet outputs:

output "availability_zones" {
  description = "The list of availability zones according with input number"
  value       = module.subnet.availability_zones
}

output "subnets_public" {
  description = "IDs of the public subnets"
  value       = module.subnet.subnets_public
}

output "subnets_private" {
  description = "IDs of the private subnets"
  value       = module.subnet.subnets_private
}

output "subnets_private_ec2" {
  description = "IDs of the ec2 private subnets"
  value       = module.subnet.subnets_private_ec2
}

output "subnets_private_db" {
  description = "IDs of the DB private subnets"
  value       = module.subnet.subnets_private_db
}

#IGW output:

output "igw_id" {
  description = "ID of the IGW"
  value       = module.igw.igw_id
}

#NAT Gateways output:

output "nat_gw" {
  description = "ID of the nat gw"
  value       = module.nat_gw.nat_gw
}

#Route table output:

output "public_rt" {
  description = "ID of the public route table"
  value       = module.route_table.public_rt
}

output "private_rt" {
  description = "ID of the private route table"
  value       = module.route_table.private_rt
}

#Security group output:

output "sg_public" {
  description = "ID of the nat gw"
  value       = module.sg.sg_public
}

output "sg_private" {
  description = "ID of the nat gw"
  value       = module.sg.sg_private
}

output "sg_private_db" {
  description = "ID of the nat gw"
  value       = module.sg.sg_private_db
}

#Key pair output:

output "key_pair" {
  description = "ID of the SSH public key"
  value       = module.key_pair.key_pair
}

#Launch template output:

output "launch_template" {
  description = "ID of the launch template"
  value       = module.launch_template.launch_template
}

#Auto scaling group output:

output "asg" {
  description = "ID of the auto scaling group"
  value       = module.asg.asg
}

#Load balancer output:

output "lb" {
  description = "ARN of the load balancer"
  value       = module.lb.lb
}

#Database output:

output "db_main" {
  description = "ID of the main DB"
  value       = module.db.db_main
}

output "db_replica" {
  description = "ID of the replica DB"
  value       = module.db.db_replica
}
