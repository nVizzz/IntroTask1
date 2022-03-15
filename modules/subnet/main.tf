data "aws_availability_zones" "working" {}

resource "aws_subnet" "public" {
  count = length(var.subnets_public)

  vpc_id            = var.vpc_id
  cidr_block        = element(var.subnets_public, count.index)
  availability_zone = element(slice(data.aws_availability_zones.working.names, 0, var.azs), count.index % var.azs)

  tags = { Name = "Public-${element(data.aws_availability_zones.working.names, count.index)}" }
}

resource "aws_subnet" "private" {
  count = length(var.subnets_private)

  vpc_id            = var.vpc_id
  cidr_block        = element(var.subnets_private, count.index)
  availability_zone = element(slice(data.aws_availability_zones.working.names, 0, var.azs), count.index % var.azs)

  tags = { Name = "Private-${element(slice(data.aws_availability_zones.working.names, 0, var.azs), count.index)}-${count.index + 1}" }
}
