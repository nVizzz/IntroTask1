variable "public_inbound" {
  description = "Rules for SG public_inbound"
}

variable "private_inbound" {
  description = "Rules for SG private_inbound"
}

variable "private_db_inbound" {
  description = "Rules for SG private_db_inbound"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "tags_common" {
  description = "Common tags for all resources"
}