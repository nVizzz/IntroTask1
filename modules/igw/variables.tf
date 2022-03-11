variable "tags_common" {
  description = "Common tags for all resources"
}

variable "igw_name" {
  description = "Provides IGW name"
  type        = string
  default     = "CloudX"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
  default = "CloudX"
}
