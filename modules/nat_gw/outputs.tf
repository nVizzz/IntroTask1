output "nat_gw" {
  description = "ID of the NAT GW"
  value       = [for nat_gw in aws_nat_gateway.cloudx : nat_gw.id]
}
