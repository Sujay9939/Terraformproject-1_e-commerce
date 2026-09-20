resource "aws_iam_instance_profile" "ec2" {
  name = "${var.project_name}-${var.environment}-ec2-profile"

  role = aws_iam_role.ec2.name
}
