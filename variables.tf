#Common variables:

variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "azs" {
  description = "The number of AZs"
  type        = number
}

variable "common_tags" {
  description = "Common tags"
  type        = map(any)
}

#VPC variables:

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support option"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
}

#IAM variables:

variable "policy_path" {
  description = "Path to the policy"
  type        = string
}

variable "assume_role_policy_path" {
  description = "var.assume_role_policy_path"
  type        = string
}

#Subnet variables:

variable "subnets_public" {
  description = "List of public subnets"
  type        = list(string)
}

variable "subnets_private" {
  description = "List of private subnets"
  type        = list(string)
}

#Security group variables:

variable "public_inbound" {
  description = "Rules for SG public_inbound"
  type        = map(any)
}

variable "public_outbound" {
  description = "Rules for SG public_outbound"
  type        = map(any)
}

variable "private_inbound" {
  description = "Rules for SG private_inbound"
  type        = map(any)
}

variable "private_outbound" {
  description = "Rules for SG private_outbound"
  type        = map(any)
}

variable "private_db_inbound" {
  description = "Rules for SG private_inbound"
  type        = map(any)
}

variable "private_db_outbound" {
  description = "Rules for SG private_outbound"
  type        = map(any)
}

#SSH key variables:

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}

#Launch template variables:

variable "image_id" {
  description = "AWS image ID (AMI)"
  type        = string
}

variable "instance_initiated_shutdown_behavior" {
  description = "Instance initiated shutdown behavior"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether associate public IP address or not"
  type        = bool
}

variable "user_data" {
  description = "Path to the user data script"
  type        = string
}

#Auto scaling group variables:

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
}

#Load balancer variables:

variable "lb_internal" {
  description = "Shows whether LB is internal or not"
  type        = bool
}

variable "lb_type" {
  description = "Type of the LB"
  type        = string
}

variable "enable_deletion_protection" {
  description = "Set whether to enable deletion protection"
  type        = bool
}

variable "lb_listener_port" {
  description = "Port of the LB listener"
  type        = number
}

variable "lb_listener_protocol" {
  description = "Protocol of the LB listener"
  type        = string
}

variable "target_group_port" {
  description = "Port of the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol of the target group"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

#DB variables:

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "backup_retention_period" {
  description = "Backup retention period for read replica"
  type        = number
}

variable "engine" {
  description = "DB engine"
  type        = string
}

variable "engine_version" {
  description = "IDs of private DB subnets"
  type        = string
}

variable "instance_class" {
  description = "DB instance class"
  type        = string
}

variable "multi_az" {
  description = "Multi AZ"
  type        = bool
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot option"
  type        = bool
}

variable "storage_type" {
  description = "DB storage type"
  type        = string
}

variable "username" {
  description = "DB username"
  type        = string
}
