resource "aws_vpc" "cloudx" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags_common, {Name = var.vpc_name})
}
