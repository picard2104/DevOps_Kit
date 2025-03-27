provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source     = "./modules/security_groups"
  vpc_id     = module.vpc.vpc_id
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = "ami-084568db4383264d4"
  instance_type      = "t2.micro"
  key_name           = "mikitaKEY"
  public_subnet_id   = module.vpc.public_subnet_id
  private_subnet_id  = module.vpc.private_subnet_ids[0]
  bastion_sg_id      = module.security_groups.bastion_sg_id
  private_sg_id      = module.security_groups.private_sg_id
}

module "rds" {
  source               = "./modules/rds"
  db_subnet_group_name = module.vpc.db_subnet_group_name
  rds_sg_id            = module.security_groups.rds_sg_id
}
