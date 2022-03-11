resource "aws_ssm_parameter" "cloudx" {
  name        = var.name
  description = "Database ghost password"
  type        = "SecureString"
  value       = var.db_password

  tags = merge(var.tags_common, {Name = "${var.name_tag}"})
}