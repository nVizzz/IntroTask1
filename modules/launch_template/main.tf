resource "aws_launch_template" "cloudx" {
  name = var.name

  iam_instance_profile {
    name = var.instance_profile
  }

  image_id = var.image_id

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.instance_type

  key_name = var.key_pair

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group]
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(var.tags_common, {Name = "${var.name}"})
  }

  user_data = filebase64("${var.user_data}")
}