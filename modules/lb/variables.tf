variable "lb_name" {
  description = "The name of load balancer"
}

variable "tags_common" {
  description = "Common tags for all resources"
}

variable "sg_lb" {
  description = "Security group for load balancer"
}

variable "subnets_public" {
  description = "IDs of the public subnets"
}

variable "lb_listener_name" {
  description = "Name of the LB listener"
}

variable "lb_listener_port" {
  description = "Port of the LB listener"
}

variable "lb_listener_protocol" {
  description = "Protocol of the LB listener"
}

variable "target_group_name" {
  description = "Name of the target group"
}

variable "target_group_port" {
  description = "Port of the target group"
}

variable "target_group_protocol" {
  description = "Protocol of the target group"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}