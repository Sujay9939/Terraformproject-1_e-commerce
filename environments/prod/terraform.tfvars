project_name = "ecommerce"

environment = "prod"

aws_region = "eu-north-1"

vpc_cidr = "10.10.0.0/16"

availability_zones = [
  "eu-north-1a",
  "eu-north-1b"
]

public_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_app_subnet_cidrs = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

private_db_subnet_cidrs = [
  "10.10.21.0/24",
  "10.10.22.0/24"
]

enable_nat_gateway = true

ami_id = "ami-0aba19e56f3eaec05"

instance_type = "t3.small"

db_name = "ecommerce"

db_username = "admin"

db_password = "CHANGE_THIS"
