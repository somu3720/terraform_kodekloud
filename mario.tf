resource "aws_instance" "mario_servers" {
     ami = var.ami
     instance_type = var.name == "tiny" ? var.small : var.large
     tags = {
          Name = var.name

     }

}


....................................
  variable.tf
....................................
  
variable "region" {
    default = "us-east-1"
}
variable  "name" {
    type = string
}
variable "ami" {
    type = string
    default = "ami-09331245601cf"
}
variable "small" {
    type = string
    default = "t2.nano"
}
variable "large" {
    type = string
    default = "t2.2xlarge"
}

.................................
  provider.tf
................................
  
provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_force_path_style = true
  endpoints {
    ec2 = "http://aws:4566"
    iam = "http://aws:4566"
    s3 = "http://aws:4566"
  }
}
