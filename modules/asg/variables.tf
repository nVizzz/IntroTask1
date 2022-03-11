variable "name" {
  description = "The name of the auto scaling group"
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
}

variable "subnets_private" {
  description = "Subnets IDs from subnet module"
}

variable "launch_template" {
  description = "ID of the launch template"
}

variable "tags" {
  description = "The tags of the Auto Scaling Group"
}

variable "subnets_private_set" {
  description = "ID of the private subnets for ASG"
}

variable "lb_target_group_arn" {
  description = "ARN of the load balancer target group"
}