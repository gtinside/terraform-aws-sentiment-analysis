module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.0.0"

  name               = "app-prod-vpc"
  cidr               = var.cidr
  azs                = [var.availability_zone]
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = true
  single_nat_gateway = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
