terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-aws-infra-state-paschalko"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source      = "./modules/vpc"
  environment = "dev"
}

module "ec2" {
  source           = "./modules/ec2"
  environment      = "dev"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  instance_type    = "t3.micro"
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "rds" {
  source                = "./modules/rds"
  environment           = "dev"
  vpc_id                = module.vpc.vpc_id
  private_subnet_id     = module.vpc.private_subnet_id
  private_subnet_2_id   = module.vpc.private_subnet_2_id
  app_security_group_id = module.ec2.security_group_id
}

