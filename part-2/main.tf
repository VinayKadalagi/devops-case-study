terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

module "Networking" {
  source          = "./modules/Networking"
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  customer_name   = var.customer_name
  environment     = var.environment
  tags            = var.tags
}

module "Instance" {
  source                      = "./modules/Instances"
  vpc_id                      = module.Networking.vpc_id
  subnet_id                   = module.Networking.public_subnet_ids
  associate_public_ip_address = true
  key_name                    = var.key_name
  instance_type               = var.instance_type
  ami_id                      = var.ami_id
  customer_name               = var.customer_name
  environment                 = var.environment
  tags                        = var.tags
}      
