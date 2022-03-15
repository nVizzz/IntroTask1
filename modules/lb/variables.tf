variable "name" {
  description = "The name of load balancer resources"
  type        = string
}

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

variable "sg_lb" {
  description = "Public security group ID for load balancer"
  type        = string
}

variable "subnets_public" {
  description = "IDs of the public subnets"
  type        = list(string)
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

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
