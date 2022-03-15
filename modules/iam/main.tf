resource "aws_iam_policy" "cloudx" {
  name        = var.name
  path        = "/"
  description = var.name

  policy = file("${var.policy_path}")
}

resource "aws_iam_role" "cloudx" {
  name = var.name

  assume_role_policy = file("${var.assume_role_policy_path}")
}

resource "aws_iam_role_policy_attachment" "cloudx" {
  role       = aws_iam_role.cloudx.name
  policy_arn = aws_iam_policy.cloudx.arn
}

resource "aws_iam_instance_profile" "cloudx" {
  name = var.name
  role = aws_iam_role.cloudx.name
}
