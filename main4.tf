module "payroll_app" {
    source = "/root/terraform-projects/modules/payroll-app"
    app_region = lookup(var.region,terraform.workspace)
    ami = lookup(var.ami,terraform.workspace)
}
  

 .........................................
    variable.tf
  .....................................
    
  variable "region" {
    type = map
    default = {
        "us-payroll" = "us-east-1"
        "uk-payroll" = "eu-west-2"
        "india-payroll" = "ap-south-1"
    }

}
variable "ami" {
    type = map
    default = {
        "us-payroll" = "ami-24e140119877avm"
        "uk-payroll" = "ami-35e140119877avm"
        "india-payroll" = "ami-55140119877avm"
    }
}
  
  
 ..................................................
    providers.tf
 .........................................
    
  provider "aws" {
  region                      = lookup(var.region, terraform.workspace)
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_force_path_style = true
  endpoints {
    ec2 = "http://aws:4566"
    dynamodb = "http://aws:4566"
    s3 = "http://aws:4566"
  }
}
