resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  tags = merge(var.tags_common, {Name = "RT-Public"})
}

resource "aws_route_table" "private_rt" {
  for_each = var.subnets_private

  vpc_id = var.vpc_id

  tags = merge(var.tags_common, {Name = "RT-Private-${each.value["az"]}"})
}

resource "aws_route" "route_public" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.cidr_block
  gateway_id             = var.igw_id
  #depends_on             = [aws_route_table.public_rt]
}

resource "aws_route" "route_private" {
  for_each = var.nat_gw

  route_table_id         = aws_route_table.private_rt[each.key].id
  destination_cidr_block = var.cidr_block
  gateway_id             = each.value
  #depends_on             = [aws_route_table.private_rt]
}

resource "aws_route_table_association" "public" {

  for_each = var.subnets_public

  subnet_id      = "${each.value["subnet"]}"
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  for_each = var.subnets_private

  subnet_id      = "${each.value["subnet"]}"
  route_table_id = aws_route_table.private_rt[each.key].id
}

resource "aws_route_table_association" "private_db" {
  for_each = var.subnets_private_db

  subnet_id      = "${each.value["subnet"]}"
  route_table_id = aws_route_table.private_rt[each.key].id
}
