provider "aws" {
  profile = "default"
  region = var.aws-region
}

module "network" {
  source = "./network"
  cidr = var.cidr
  availability_zone = var.availability_zone
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
}

module "compute" {
  source = "./compute"
}

module "containers" {
  source = "./containers"
}

module "datastore" {
  source = "./datastore"
  redis_availability_zone = var.availability_zone
}

module "queue" {
  source = "./queue"
}

module "sentiment_analysis" {
  source = "./sentiment_analysis"
  cluster_id = module.containers.ecs_cluster_id
}
