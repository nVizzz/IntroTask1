output "key_pair" {
  description = "ID of the key pair"
  value       = aws_key_pair.ssh_key.id
}
