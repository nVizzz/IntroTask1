variable "name" {
  description = "The name of the DB related resources"
}

variable "tags_common" {
  description = "Common tags for all resources"
}

variable "availability_zone_primary" {
  description = "Availability zone for primary DB"
}

variable "availability_zone_replica1" {
  description = "Availability zone for read replica1"
}

variable "availability_zone_replica2" {
  description = "Availability zone for read replica2"
}

variable "subnets_private_db" {
  description = "IDs of private DB subnets"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
}

variable "engine" {
  description = "DB engine"
}

variable "engine_version" {
  description = "IDs of private DB subnets"
}

variable "instance_class" {
  description = "DB instance class"
}

variable "username" {
  description = "DB username"
}

variable "db_password" {
  description = "DB password"
}

variable "parameter_group_name" {
  description = "Parameter group name"
}

variable "storage_type" {
  description = "DB storage type"
}

variable "sg_private_db" {
  description = "DB security group"
}

variable "backup_retention_period" {
  description = "Backup retention period for read replica"
}