resource "aws_db_instance" "mysql" {
  identifier = "${var.project_name}-${var.environment}-mysql"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = var.instance_class

  allocated_storage = 20

  max_allocated_storage = 100

  storage_type = "gp3"

  storage_encrypted = true

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  port = 3306

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  publicly_accessible = false

  multi_az = true

  backup_retention_period = 7

  backup_window = "03:00-04:00"

  maintenance_window = "sun:04:00-sun:05:00"

  auto_minor_version_upgrade = true

  deletion_protection = false

  skip_final_snapshot = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql"
    Environment = var.environment
    Project     = var.project_name
  }
}
