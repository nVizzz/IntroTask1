output "subnet_public" {
  description = "ID of the public subnets"
  value       = module.subnet.subnets_public
}

output "subnet_private" {
  description = "ID of the private subnets"
  value       = module.subnet.subnets_private
}

output "subnet_private_db" {
  description = "ID of the private db subnets"
  value       = module.subnet.subnets_private_db
}

output "nat_gw" {
  description = "ID of the nat gw"
  value       = module.nat_gw.nat_gw
}

output "sg_public" {
  description = "ID of the nat gw"
  value       = module.sg.sg_public
}

output "sg_private" {
  description = "ID of the nat gw"
  value       = module.sg.sg_private
}

output "sg_private_db" {
  description = "ID of the nat gw"
  value       = module.sg.sg_private_db
}
