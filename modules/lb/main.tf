resource "aws_lb" "cloudx" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_lb]

  dynamic "subnet_mapping" {
    for_each = var.subnets_public
    content {
    subnet_id = subnet_mapping.value["subnet"]
    }
  }

  enable_deletion_protection = true

  tags = merge(var.tags_common, {Name = "${var.lb_name}"})
}

resource "aws_lb_listener" "cloudx" {
  load_balancer_arn = aws_lb.cloudx.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.cloudx.arn
      }
    }
  }

  tags = merge(var.tags_common, {Name = "${var.lb_listener_name}"})
}

resource "aws_lb_target_group" "cloudx" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  tags = merge(var.tags_common, {Name = "${var.target_group_name}"})
}
