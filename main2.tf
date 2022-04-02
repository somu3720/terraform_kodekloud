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
  key_name = "cerberus"
  user_data = file("./install-nginx.sh")
}

#You can also use variable for key_name

resource "aws_key_pair" "cerberus-key" {
  key_name = "cerberus"
  public_key = file(".ssh/cerberus.pub")
}

resource "aws_eip" "eip" {
  vpc = true
  instance = aws_instance.cerberus.id
  provisioner "local-exec" {
      command = "echo${aws_eip.eip.public_dns} >> /root/cerberus_public_dns.txt"
  }
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
