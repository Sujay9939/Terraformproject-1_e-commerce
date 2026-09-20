resource "aws_security_group" "db" {
  name = "${var.project_name}-${var.environment}-db-sg"

  description = "Security group for RDS MySQL"

  vpc_id = var.vpc_id

  ingress {
    description = "MySQL from application servers"

    from_port = 3306
    to_port   = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.app.id
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
    Name        = "${var.project_name}-${var.environment}-db-sg"
    Environment = var.environment
  }
}
