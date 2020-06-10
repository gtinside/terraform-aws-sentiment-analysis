variable "aws-region" {
  description = "Variable for holding aws region"
  default = "us-east-2"
}

variable "private_subnets" {
  type = list(string)
  description = "Variable to hold list of private subnets"
  default = ["10.0.128.0/17"]
}

variable "public_subnets" {
  type = list(string)
  description = "Variable to hold list of public subnets"
  default = ["10.0.0.0/24"]
}

variable "owner" {
  description = "Name of the owner"
  default = " 089493118010"
}

variable "cidr" {
  description = "Value of cidr"
  default = "10.0.0.0/16"
}

variable "availability_zone" {
  description = "AWS Availability zones"
  default = "us-east-2a"
}