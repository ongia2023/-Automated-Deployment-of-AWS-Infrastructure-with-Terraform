provider "aws" {
  region = var.default_region
}

module "vpc" {
  source   = "./modules/vpc"
  regions  = var.regions
}

module "ec2_instance" {
  source                  = "./modules/ec2_instance"
  regions                 = var.regions
  availability_zones      = var.availability_zones
  environments            = var.environments
  instance_type           = var.instance_type
  ami                     = var.ami
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
}
