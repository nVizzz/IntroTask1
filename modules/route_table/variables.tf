variable "subnets_public" {
  description = "Subnets IDs from subnet module"
}

variable "subnets_private" {
  description = "Subnets IDs from subnet module"
}

variable "subnets_private_db" {
  description = "Subnets IDs from subnet module"
}

variable "nat_gw" {
  description = "List of NAT GW"
}

variable "tags_common" {
  description = "Common tags for all resources"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "igw_id" {
  description = "IGW ID"
  type = string
}

variable "cidr_block" {
  description = "CIDR block"
  type = string
  default = "0.0.0.0/0"
}
