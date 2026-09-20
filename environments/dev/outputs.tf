output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "private_app_subnets" {
  value = module.vpc.private_app_subnet_ids
}

output "private_db_subnets" {
  value = module.vpc.private_db_subnet_ids
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "autoscaling_group_name" {
  value = module.autoscaling.autoscaling_group_name
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
