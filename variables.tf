variable "ssh_key" {
  description = "SSH public key"
}

variable "db_password" {
  description = "Database password"
}

variable "tags_common" {
  description = "Common tags for all resources"
  type = map(any)
  default = {
    Environment = "Development"
    Terraform   = true
    Project     = "CloudX"
    Owner       = "Roman_Izvozchikov"
  }
}