module "ec2" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "sentiment-ec2"
  instance_count         = 1
  ami                    = "ami-083ebc5a49573896a"
  instance_type          = "t2.micro"
  key_name               = "GoChat"
  monitoring             = true
  vpc_security_group_ids = ["sg-a24510da", "sg-0e650c7d55eed6386"]
  subnet_id              = "subnet-954e7cef"
}

output "ec2_instance_id" {
  value = module.ec2.id
}

output "ec2_instance_state" {
  value = module.ec2.instance_state
}

output "ec2_instance_public_ip" {
  value = module.ec2.public_ip
}