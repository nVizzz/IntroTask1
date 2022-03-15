variable "name" {
  description = "The name of launch template"
  type        = string
}

variable "instance_profile" {
  description = "Instance_profile ID"
  type        = string
}

variable "image_id" {
  description = "Image ID"
  type        = string
}

variable "instance_initiated_shutdown_behavior" {
  description = "Instance initiated shutdown behavior"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_pair" {
  description = "Key pair ID"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether associate public IP address or not"
  type        = bool
}

variable "security_group" {
  description = "Security group ID"
  type        = string
}

variable "common_tags" {
  description = "Resource tags"
  type        = map(any)
}

variable "user_data" {
  description = "Path to user data script"
  type        = string
}
