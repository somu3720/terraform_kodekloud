variable "ami" {
  default = "ami-06178cf087598769c"
}

variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "m5.large"
}



resource "aws_instance" "cerberus" {
  ami = var.ami
  instance_type = var.instance_type

}



.............................................
  
provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://aws:4566"
  }
}
