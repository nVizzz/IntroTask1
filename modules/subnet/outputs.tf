output "availability_zones" {
  description = "The list of availability zones according with input number"
  value       = slice(data.aws_availability_zones.working.names, 0, var.azs)
}

output "subnets_public" {
  description = "IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "subnets_private" {
  description = "IDs of the all private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "subnets_private_ec2" {
  description = "IDs of the ec2 private subnets"
  value       = slice([for subnet in aws_subnet.private : subnet.id], 0, var.azs)
}

output "subnets_private_db" {
  description = "IDs of the DB private subnets"
  value       = slice([for subnet in aws_subnet.private : subnet.id], var.azs, var.azs + var.azs)
}
