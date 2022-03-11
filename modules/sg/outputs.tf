output "sg_public" {
  description = "ID of the public SG"
  value       = aws_security_group.public.id
}

output "sg_private" {
  description = "ID of the private SG"
  value       = aws_security_group.private.id
}

output "sg_private_db" {
  description = "ID of the private_db SG"
  value       = aws_security_group.private_db.id
}
