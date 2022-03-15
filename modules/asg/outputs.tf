output "asg" {
  description = "ID of the auto scaling group"
  value       = aws_autoscaling_group.cloudx.id
}
