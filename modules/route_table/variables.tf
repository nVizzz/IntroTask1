variable "availability_zones" {
  description = "The list of availability zones according with input number"
  type        = list(string)
}

variable "subnets_public" {
  description = "Public subnets IDs from subnet module"
  type        = list(string)
}

variable "subnets_private" {
  description = "Private subnets IDs from subnet module"
  type        = list(string)
}

variable "nat_gw" {
  description = "List of NAT GW"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "IGW ID"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}
