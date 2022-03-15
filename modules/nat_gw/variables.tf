variable "subnets_public" {
  description = "Public subnets IDs from subnet module"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "ID of IGW"
  type        = string
}
