output "aws_iam_role" {
  description = "ID of the IAM role"
  value       = aws_iam_role.cloudx.id
}

output "instance_profile" {
  description = "ID of the instance profile"
  value       = aws_iam_instance_profile.cloudx.id
}
