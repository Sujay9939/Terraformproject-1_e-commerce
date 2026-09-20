project_name = "ecommerce"

environment = "dev"

aws_region = "eu-north-1"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "eu-north-1a",
  "eu-north-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_app_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

private_db_subnet_cidrs = [
  "10.0.21.0/24",
  "10.0.22.0/24"
]

enable_nat_gateway = true

ami_id = "YOUR_AMI_ID"

instance_type = "t3.micro"

db_name = "ecommerce"

db_username = "admin"

db_password = "CHANGE_THIS"
