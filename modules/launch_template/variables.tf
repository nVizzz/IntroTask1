variable "name" {
  description = "The name of launch template"
}

variable "instance_profile" {
  description = "Instance_profile ID"
}

variable "image_id" {
  description = "Image ID"
}

variable "instance_type" {
  description = "Image ID"
}

variable "key_pair" {
  description = "Key pair ID"
}

variable "security_group" {
  description = "Security group ID"
}

variable "user_data" {
  description = "Path to user data script"
}

variable "tags_common" {
  description = "Common tags for all resources"
}