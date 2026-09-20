module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_app_subnet_cidrs = var.private_app_subnet_cidrs

  private_db_subnet_cidrs = var.private_db_subnet_cidrs

  enable_nat_gateway = var.enable_nat_gateway
}

module "security_groups" {
  source = "../../modules/security-groups"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment
}

module "alb" {
  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  security_group_id = module.security_groups.alb_security_group_id

  target_port = 8080
}

module "ec2" {
  source = "../../modules/ec2"

  project_name = var.project_name
  environment  = var.environment

  ami_id = var.ami_id

  instance_type = var.instance_type

  security_group_id = module.security_groups.app_security_group_id

  instance_profile_name = module.iam.instance_profile_name
}

module "autoscaling" {
  source = "../../modules/autoscaling"

  project_name = var.project_name
  environment  = var.environment

  launch_template_id = module.ec2.launch_template_id

  launch_template_version = module.ec2.launch_template_latest_version

  private_app_subnet_ids = module.vpc.private_app_subnet_ids

  target_group_arn = module.alb.target_group_arn

  min_size = 2

  max_size = 6

  desired_capacity = 2
}

module "rds" {
  source = "../../modules/rds"

  project_name = var.project_name
  environment  = var.environment

  private_db_subnet_ids = module.vpc.private_db_subnet_ids

  security_group_id = module.security_groups.db_security_group_id

  db_name = var.db_name

  db_username = var.db_username

  db_password = var.db_password

  instance_class = "db.t3.micro"
}
