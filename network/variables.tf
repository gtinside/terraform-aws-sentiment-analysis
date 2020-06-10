variable "availability_zone" {
  description = "Variable for holding aws region"
}

variable "private_subnets" {
  type = list(string)
  description = "Variable to hold list of private subnets"
}

variable "public_subnets" {
  type = list(string)
  description = "Variable to hold list of public subnets"
}

variable "cidr" {
  description = "Value of cidr"
}