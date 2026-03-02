# Terraform AWS VPC Module

## Inputs

* project – (Required) string – Name of the project. Used for resource naming and tagging.
* environment – (Required) string – Environment name (e.g., dev, stage, prod).
* vpc_cidr – (Optional) string – CIDR block for the VPC. Default: "10.0.0.0/16".
* vpc_tags – (Optional) map(any) – Additional tags to apply to the VPC. Default: {}.
* igw_tags – (Optional) map(any) – Additional tags to apply to the Internet Gateway. Default: {}.
* public_subnet_cidrs – (Optional) list(string) – List of CIDR blocks for public subnets.
Default: "10.0.1.0/24", "10.0.2.0/24".
* public_subnet_tags – (Optional) map(any) – Additional tags for public subnets. Default: {}.
* private_subnet_cidrs – (Optional) list(string) – List of CIDR blocks for private subnets.
Default: "10.0.11.0/24", "10.0.12.0/24".
* private_subnet_tags – (Optional) map(any) – Additional tags for private subnets. Default: {}.
* database_subnet_cidrs – (Optional) list(string) – List of CIDR blocks for database subnets.
Default: "10.0.21.0/24", "10.0.22.0/24".
* database_subnet_tags – (Optional) map(any) – Additional tags for database subnets. Default: {}.
* public_route_table_tags – (Optional) map(any) – Additional tags for the public route table. Default: {}.
* private_route_table_tags – (Optional) map(any) – Additional tags for the private route table. Default: {}.
* database_route_table_tags – (Optional) map(any) – Additional tags for the database route table. Default: {}.
* eip_tags – (Optional) map(any) – Additional tags for the Elastic IP used by the NAT Gateway. Default: {}.
* nat_gateway_tags – (Optional) map(any) – Additional tags for the NAT Gateway. Default: {}.
* is_peering_required – (Optional) bool – Determines whether VPC peering should be created. Default: false.

## Outputs

* azs_info – List of available AWS Availability Zones in the current region (e.g., us-east-1a, us-east-1b).
* vpc_id – ID of the created VPC.
* vpc_cidr – CIDR block of the created VPC.
* public_subnet_ids – List of IDs of public subnets.
* private_subnet_ids – List of IDs of private subnets.
* database_subnet_ids – List of IDs of database subnets.
* igw_id – ID of the created Internet Gateway.
* nat_gateway_id – ID of the created NAT Gateway.
* nat_eip_id – ID of the created Elastic ip.
* public_route_table_id – ID of the created pubic route table.
* private_route_table_id – ID of the created private route table.
* database_route_table_id – ID of the created database route table.