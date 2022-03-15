resource "aws_launch_template" "cloudx" {
  name = var.name

  iam_instance_profile {
    name = var.instance_profile
  }

  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = var.instance_type
  key_name                             = var.key_pair

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    security_groups             = [var.security_group]
  }

  tag_specifications {
    resource_type = "instance"
    tags          = merge(var.common_tags, { Name = "${var.name}" })
  }

  user_data = filebase64("${var.user_data}")
}
