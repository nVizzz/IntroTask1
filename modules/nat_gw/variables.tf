variable "subnets" {
  description = "Subnets IDs from subnet module"
}

variable "igw_id" {
  description = "ID of IGW"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "tags_common" {
  description = "Common tags for all resources"
}