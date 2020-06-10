module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "2.1.0"
  name    = "TweetsQueue"
}

output "queue_name" {
  value = module.sqs.this_sqs_queue_name
}

output "queue_url" {
  value = module.sqs.this_sqs_queue_id
}