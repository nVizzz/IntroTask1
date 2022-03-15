variable "vpc_cidr" {
  description = "Provides VPC CIDR"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support option"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
}
