module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
  }

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  public_subnets = module.vpc.public_subnets
  ec2_sg_id = module.security_groups.ec2_sg_id
  db_host = module.rds.rds_endpoint[0]
  db_user = "admin"
  db_password = "Password123!"
  db_name = "mysql"
}

module "alb"{
  source = "./modules/alb"
  project_name = var.project_name
  public_subnets = module.vpc.public_subnets
  alb_sg_id = module.security_groups.alb_sg_id
  vpc_id = module.vpc.vpc_id
  instance_ids = module.ec2.instance_ids
}

module "rds" {
  source = "./modules/rds"
  private_subnets = module.vpc.private_subnets
  rds_sg_id = module.security_groups.rds_sg_id
}