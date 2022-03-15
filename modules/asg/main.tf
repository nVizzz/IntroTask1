resource "aws_autoscaling_group" "cloudx" {
  name                = var.name
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = toset(var.subnets_private)

  launch_template {
    id = var.launch_template
  }

  lifecycle {
    ignore_changes = [
      load_balancers,
      target_group_arns
    ]
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_attachment" "cloudx" {
  autoscaling_group_name = aws_autoscaling_group.cloudx.id
  lb_target_group_arn    = var.lb_target_group_arn
}
