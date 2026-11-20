provider "aws" {
  region = "us-east-1"
}

module "network" {
  source   = "../../modules/network"
  env      = var.env
  vpc_cidr = var.vpc_cidr
}

module "ecs" {
  source              = "../../modules/ecs"
  env                 = var.env
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  private_subnet_ids  = module.network.private_subnet_ids
  ecs_cpu             = var.ecs_cpu
  ecs_memory          = var.ecs_memory
  desired_count       = var.desired_count
  deletion_protection = var.deletion_protection
}

module "rds" {
  source                  = "../../modules/rds"
  env                     = var.env
  vpc_id                  = module.network.vpc_id
  private_subnet_ids      = module.network.private_subnet_ids
  ecs_sg_id               = module.ecs.ecs_sg_id
  db_instance_class       = var.db_instance_class
  allocated_storage       = var.allocated_storage
  backup_retention_period = var.backup_retention_period
  deletion_protection     = var.deletion_protection
  db_password             = var.db_password
}

output "alb_url" { value = module.ecs.alb_dns_name }
