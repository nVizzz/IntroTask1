output "nat_gw" {
  description = "ID of the NAT GW"
  value       = {
    for k, nat_gw in aws_nat_gateway.cloudx : k => nat_gw.id
  }
}