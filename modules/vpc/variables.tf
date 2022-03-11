variable "tags_common" {
  description = "Common tags for all resources"
}

variable "vpc_name" {
  description = "Provides VPC CIDR"
  type        = string
  default     = "CloudX"
}

variable "vpc_cidr" {
  description = "Provides VPC CIDR"
  type        = string
  default     = "10.10.0.0/16"
}
