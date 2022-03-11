variable "name" {
  description = "The name of IAM role/policy/instance_profile"
}

variable "policy_path" {
  description = "Path to the policy"
}

variable "assume_role_policy_path" {
  description = "Path to the assume_role_policy"
}

variable "tags_common" {
  description = "Common tags for all resources"
}