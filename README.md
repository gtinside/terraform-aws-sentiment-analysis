### Sentiment Analysis Terraform module
Terraform module that creates auto scaling resources and deploy [sentiment analysis application](https://github.com/gtinside/sentiment_analysis) to AWS

Following AWS services are created by this module:
1. VPC
2. Security Groups
3. SQS Queue
4. Redis cluster
5. EC2 instance
6. ECS cluster
7. ECS Services
8. ECS Service tasks for sentiment analysis [server](https://hub.docker.com/r/gtinside/sentiment-analysis-server) and [web](https://hub.docker.com/r/gtinside/sentiment-analysis-web)

#### Inputs
<hr/>

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws-region | AWS Region for all the services | `string` | `us-east-2` | no |
| private_subnets | List of private subnets | `list(string)` | `["10.0.128.0/17"]` | no |
| public_subnets | List of public subnets | `list(string)` | `["10.0.0.0/24"]` | no |
| owner | Name of the service owner | `string` | `089493118010` | no |
| cidr | Classless Inter-Domain Routing (CIDR) block | `string` | `10.0.0.0/16` | no |
| availability_zone | AWS default availability zone | `string` | `us-east-2a` | no |

#### Outputs
<hr/>

| Name | Description | 
|------|-------------|
| ec2_instance_id | EC2 instance identifier |
| ec2_instance_state | EC2 instance state |
| ec2_instance_public_ip | EC2 instance public ip |
| ecs_cluster_id | ECS cluster identifier |
| redis_nodes | List of node objects including id, address, port and availability_zone |
| sqs_queue_name | Name of SQS queue |
| sqs_queue_url | SQS Queue URL for connection |

#### Usage
<hr/>

```
terraform init 
terraform plan
terraform apply
# when you are done, don't forget to destroy
terraform destroy
```
