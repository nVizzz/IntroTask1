resource "aws_security_group" "public" {
  name        = "public"
  description = "allows access for public networks"
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each = var.public_inbound
    content {
      description = ingress.key
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [ingress.value["cidr_block"]]
    }
  }

  dynamic "egress" {
    for_each = var.public_outbound
    content {
      description = egress.key
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = [egress.value["cidr_block"]]
    }
  }

  tags = { Name = "SG-Public" }
}

resource "aws_security_group" "private" {
  name        = "private"
  description = "allows access for private networks"
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each = var.private_inbound
    content {
      description = ingress.key
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [ingress.value["cidr_block"]]
    }
  }

  dynamic "egress" {
    for_each = var.private_outbound
    content {
      description = egress.key
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = [egress.value["cidr_block"]]
    }
  }

  tags = { Name = "SG-Private" }
}

resource "aws_security_group" "private_db" {
  name        = "private_db"
  description = "allows access for private_db networks"
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each = var.private_db_inbound
    content {
      description = ingress.key
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [ingress.value["cidr_block"]]
    }
  }

  dynamic "egress" {
    for_each = var.private_db_outbound
    content {
      description = egress.key
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = [egress.value["cidr_block"]]
    }
  }

  tags = { Name = "SG-Private_DB" }
}
