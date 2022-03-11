resource "aws_eip" "nat-gw" {
  for_each = var.subnets
  
  vpc      = true

  tags = merge(var.tags_common, {Name = "eip-for-${each.value["az"]}-nat"})

}

data "aws_internet_gateway" "cloudx" {
  internet_gateway_id = var.igw_id
}
/*
data "aws_subnets" "cloudx" {
data.aws_subnets.cloudx["${each.value["subnet"]}"]
}
*/
resource "aws_nat_gateway" "cloudx" {
  for_each = var.subnets

  allocation_id = aws_eip.nat-gw["${each.key}"].id
  subnet_id     = "${each.value["subnet"]}"

  tags = merge(var.tags_common, {Name = "nat-gw-for-${each.value["az"]}"})

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [data.aws_internet_gateway.cloudx]
}
