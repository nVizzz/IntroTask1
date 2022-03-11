resource "aws_internet_gateway" "cloudx" {
  vpc_id = var.vpc_id

  tags = merge(var.tags_common, {Name = var.igw_name})
}