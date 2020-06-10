output "vpc_id" {
  description = "VPC identifier"
  value       = module.network.vpc_id
}

output "ec2_instance_id" {
  description = "EC2 instance identifier"
  value = module.compute.ec2_instance_id
}

output "ec2_instance_state" {
  description = "EC2 instance state"
  value = module.compute.ec2_instance_state
}

output "ec2_instance_public_ip" {
  description = "EC2 instance public ip"
  value = module.compute.ec2_instance_public_ip
}

output "ecs_cluster_id" {
  description = "ECS cluster identifier"
  value = module.containers.ecs_cluster_id
}

output "redis_nodes" {
  description = "List of node objects including id, address, port and availability_zone"
  value = module.datastore.redis_nodes
}

output "sqs_queue_name" {
  description = "Name of SQS queue"
  value = module.queue.queue_name
}

output "sqs_queue_url" {
  description = "SQS Queue URL for connection"
  value = module.queue.queue_url
}