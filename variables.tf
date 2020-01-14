# These variables will be defined in a file named terraform.tfvars   
# See declaration.tfvars for formatting
variable "region_name" {}

variable "bucket_name" {}

variable "lamda_role_arn" {}

variable "lambda_zip_location" {}

variable "ec2-instance-key-name" {}

variable "ec2-instance-public-key" {}

variable "ec2-security-group-name" {}