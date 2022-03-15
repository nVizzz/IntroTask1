variable "name" {
  description = "The name of the auto scaling group"
  type        = string
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
}

variable "subnets_private" {
  description = "Subnets IDs from subnet module"
  type        = list(string)
}

variable "launch_template" {
  description = "ID of the launch template"
  type        = string
}

variable "tags" {
  description = "The tags of the Auto Scaling Group"
  type        = map(any)
}

variable "lb_target_group_arn" {
  description = "ARN of the load balancer target group"
  type        = string
}
