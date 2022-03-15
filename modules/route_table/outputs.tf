output "public_rt" {
  description = "ID of the public route table"
  value       = aws_route_table.public_rt.id
}

output "private_rt" {
  description = "IDs of the private route tables"
  value       = [for rt in aws_route_table.private_rt : rt.id]
}
