output "lb" {
  description = "ARN of the load balancer"
  value       = aws_lb.cloudx.arn
}

output "lb_target_group_arn" {
  description = "ARN of the load balancer target group"
  value       = aws_lb_target_group.cloudx.arn
}
