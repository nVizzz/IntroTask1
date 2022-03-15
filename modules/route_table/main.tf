resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "private_rt" {
  count = length(var.availability_zones)

  vpc_id = var.vpc_id

  tags = { Name = "RT-Private-${var.availability_zones[count.index]}" }
}

resource "aws_route" "route_public" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.cidr_block
  gateway_id             = var.igw_id
}

resource "aws_route" "route_private" {
  count = length(var.availability_zones)

  route_table_id         = aws_route_table.private_rt[count.index].id
  destination_cidr_block = var.cidr_block
  gateway_id             = var.nat_gw[count.index]
}

resource "aws_route_table_association" "public" {
  count = length(var.subnets_public)

  subnet_id      = var.subnets_public[count.index]
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  count = length(var.availability_zones)

  subnet_id      = var.subnets_private[count.index]
  route_table_id = aws_route_table.private_rt[count.index].id
}
