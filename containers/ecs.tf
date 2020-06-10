module "ecs" {
  source = "terraform-aws-modules/ecs/aws"
  name = "prod-ecs-cluster"
}

output "ecs_cluster_id" {
  value = module.ecs.this_ecs_cluster_id
}