resource "aws_subnet" "public" {

  for_each = var.subnets_pub

  vpc_id            = var.vpc_id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = merge(var.tags_common, {Name = "${each.value["name"]}"})
}

resource "aws_subnet" "private" {

  for_each = var.subnets_priv

  vpc_id            = var.vpc_id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = merge(var.tags_common, {Name = "${each.value["name"]}"})
}

resource "aws_subnet" "private_db" {

  for_each = var.subnets_priv_db

  vpc_id            = var.vpc_id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = merge(var.tags_common, {Name = "${each.value["name"]}_db"})
}