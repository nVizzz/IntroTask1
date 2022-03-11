output "subnets_public" {
  description = "ID of the public subnets"
  value       = tomap({
    for k, subnet in aws_subnet.public : k => {
      az = subnet.availability_zone
      subnet = subnet.id
    }
  })
}

output "subnets_private" {
  description = "ID of the private subnets"
  value       = tomap({
    for k, subnet in aws_subnet.private : k => {
      az = subnet.availability_zone
      subnet = subnet.id
    }
  })
}

output "subnets_private_db" {
  description = "ID of the private db subnets"
  value       = tomap({
    for k, subnet in aws_subnet.private_db : k => {
      az = subnet.availability_zone
      subnet = subnet.id
    }
  })
}

output "subnets_private_set" {
  description = "ID of the private subnets for ASG"
  value = toset([for subnet in aws_subnet.private: subnet.id])
}