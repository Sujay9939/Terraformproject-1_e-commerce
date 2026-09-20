resource "aws_launch_template" "app" {
  name = "${var.project_name}-${var.environment}-launch-template"

  image_id = var.ami_id

  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash

    yum update -y

    yum install -y docker

    systemctl enable docker

    systemctl start docker

    echo "E-Commerce application server initialized"

  EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.project_name}-${var.environment}-app-server"
      Environment = var.environment
      Project     = var.project_name
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
