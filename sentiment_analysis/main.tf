resource "aws_cloudwatch_log_group" "sentiment_analysis_server" {
  name              = "sentiment_analysis_server"
  retention_in_days = 1
}

resource "aws_cloudwatch_log_group" "sentiment_analysis_web" {
  name              = "sentiment_analysis_web"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "sentiment_analysis_server" {
  family                = "sentiment_analysis_server"
  container_definitions = file("task-definitions/sentiment-analysis-server.json")
  requires_compatibilities = ["EC2"]

  volume {
    name      = "service-storage"
    host_path = "/ecs/sentiment_analysis_server_storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a]"
  }
}

resource "aws_ecs_task_definition" "sentiment_analysis_web" {
  family                = "sentiment_analysis_web"
  container_definitions = file("task-definitions/sentiment-analysis-web.json")
  requires_compatibilities = ["EC2"]
  network_mode = "host"

  volume {
    name      = "service-storage"
    host_path = "/ecs/sentiment_analysis_web_storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a]"
  }
}

resource "aws_ecs_service" "sentiment-analysis-server-service" {
  name = "sentiment-analysis-server-service"
  cluster = var.cluster_id
  task_definition = aws_ecs_task_definition.sentiment_analysis_server.arn

  desired_count = 1

  deployment_maximum_percent = 100
  deployment_minimum_healthy_percent = 0
}

resource "aws_ecs_service" "sentiment-analysis-web-service" {
  name = "sentiment-analysis-web-service"
  cluster = var.cluster_id
  task_definition = aws_ecs_task_definition.sentiment_analysis_web.arn

  desired_count = 1

  deployment_maximum_percent = 100
  deployment_minimum_healthy_percent = 0
}