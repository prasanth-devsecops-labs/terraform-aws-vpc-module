# Terraform AWS VPC Module

## Inputs
* project - (Required) string type, user must provide project name.
* environment - (Required) string type, user must provide environment name.
* vpc_cidr - (Optional) string type
* vpc_tags - (Optional) map type
* igw_tags - (Optional) map type
* public_subnet_cidrs - (Optional) list type, default cidrs "10.0.1.0/24", "10.0.2.0/24"
* public_subnet_tags - (Optional) map type

## Outputs
* azs_info - information of aws_availability_zones, ex: us-east-1a, us-east-1b etc