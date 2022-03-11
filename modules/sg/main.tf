resource "aws_security_group" "public" {
  name        = "public"
  description = "allows access for public networks"
  vpc_id      = var.vpc_id

  tags = merge(var.tags_common, {Name = "SG-Public"})
}

resource "aws_security_group" "private" {
  name        = "private"
  description = "allows access for private networks"
  vpc_id      = var.vpc_id

  tags = merge(var.tags_common, {Name = "SG-Private"})
}

resource "aws_security_group" "private_db" {
  name        = "private_db"
  description = "allows access for database networks"
  vpc_id      = var.vpc_id

  tags = merge(var.tags_common, {Name = "SG-Private_DB"})
}

resource "aws_security_group_rule" "public_inbound" {
  for_each = var.public_inbound

  type                     = "ingress"
  from_port                = each.value["port"]
  to_port                  = each.value["port"]
  protocol                 = each.value["protocol"]
  cidr_blocks               = [each.value["cidr_block"]]
  security_group_id        = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "private_inbound" {
  for_each = var.private_inbound

  type                     = "ingress"
  from_port                = each.value["port"]
  to_port                  = each.value["port"]
  protocol                 = each.value["protocol"]
  cidr_blocks               = [each.value["cidr_block"]]
  security_group_id        = aws_security_group.private.id
}

resource "aws_security_group_rule" "private_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "private_db_inbound" {
  for_each = var.private_db_inbound

  type                     = "ingress"
  from_port                = each.value["port"]
  to_port                  = each.value["port"]
  protocol                 = each.value["protocol"]
  cidr_blocks              = [each.value["cidr_block"]]
  security_group_id        = aws_security_group.private_db.id
}

resource "aws_security_group_rule" "private_db_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_db.id
}