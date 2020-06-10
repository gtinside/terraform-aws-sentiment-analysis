
resource "aws_elasticache_cluster" "tweets" {
  cluster_id           = "elastic-cache-cluster-id"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  availability_zone    = var.redis_availability_zone
}

output "redis_nodes" {
  value = aws_elasticache_cluster.tweets.cache_nodes
}