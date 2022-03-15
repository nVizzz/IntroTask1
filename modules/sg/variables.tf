variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_inbound" {
  description = "Rules for SG public_inbound"
  type        = map(any)
}

variable "public_outbound" {
  description = "Rules for SG public_outbound"
  type        = map(any)
}

variable "private_inbound" {
  description = "Rules for SG private_inbound"
  type        = map(any)
}

variable "private_outbound" {
  description = "Rules for SG private_outbound"
  type        = map(any)
}

variable "private_db_inbound" {
  description = "Rules for SG private_db_inbound"
  type        = map(any)
}

variable "private_db_outbound" {
  description = "Rules for SG private_db_outbound"
  type        = map(any)
}
