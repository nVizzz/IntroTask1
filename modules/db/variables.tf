variable "azs" {
  description = "The number of AZs"
  type        = number
}

variable "name" {
  description = "The name of the DB related resources"
  type        = string
}

variable "availability_zones" {
  description = "The list of availability zones"
  type        = list(string)
}

variable "subnets_private_db" {
  description = "IDs of private DB subnets"
  type        = list(string)
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "engine" {
  description = "DB engine"
  type        = string
}

variable "engine_version" {
  description = "IDs of private DB subnets"
  type        = string
}

variable "instance_class" {
  description = "DB instance class"
  type        = string
}

variable "multi_az" {
  description = "Multi AZ"
  type        = bool
}

variable "username" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type        = string
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot option"
  type        = bool
}

variable "storage_type" {
  description = "DB storage type"
  type        = string
}

variable "sg_private_db" {
  description = "DB security group"
  type        = string
}

variable "backup_retention_period" {
  description = "Backup retention period for read replica"
  type        = number
}
