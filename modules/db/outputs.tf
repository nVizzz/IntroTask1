output "db_main" {
  description = "ID of the main DB"
  value       = aws_db_instance.cloudx.id
}

output "db_replica" {
  description = "ID of the replica DB"
  value       = [for replica in aws_db_instance.cloudx_replica : replica.id]
}
