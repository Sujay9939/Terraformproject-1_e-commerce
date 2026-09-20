resource "aws_security_group" "app" {
  name = "${var.project_name}-${var.environment}-app-sg"

  description = "Security group for application servers"

  vpc_id = var.vpc_id

  ingress {
    description = "Application traffic from ALB"

    from_port = 8080
    to_port   = 8080

    protocol = "tcp"

    security_groups = [
      aws_security_group.alb.id
    ]
  }

  egress {
    description = "Allow outbound traffic"

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-app-sg"
    Environment = var.environment
  }
}
