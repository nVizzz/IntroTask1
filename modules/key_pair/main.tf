resource "aws_key_pair" "ssh_key" {
  key_name   = var.name
  public_key = var.ssh_key

  tags = merge(var.tags_common, {Name = "${var.name}"})
}
