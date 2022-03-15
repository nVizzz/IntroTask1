resource "aws_eip" "nat-gw" {
  count = length(var.subnets_public)

  vpc = true

  tags = { Name = "eip-for-nat-gw-${count.index + 1}" }

}

data "aws_internet_gateway" "cloudx" {
  internet_gateway_id = var.igw_id
}

resource "aws_nat_gateway" "cloudx" {
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [data.aws_internet_gateway.cloudx]

  count = length(var.subnets_public)

  allocation_id = aws_eip.nat-gw["${count.index}"].id
  subnet_id     = var.subnets_public[count.index]

  tags = { Name = "nat-gw-${count.index + 1}" }
}
