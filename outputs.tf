# Availability Zones
output "azs_info" {
  description = "List of available AWS Availability Zones in the current region."
  value       = data.aws_availability_zones.available.names
}

# VPC
output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the created VPC."
  value       = aws_vpc.main.cidr_block
}


# Subnets
output "public_subnet_ids" {
  description = "List of IDs of public subnets."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets."
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "database_subnet_ids" {
  description = "List of IDs of database subnets."
  value       = [for subnet in aws_subnet.database : subnet.id]
}

# Internet Gateway
output "igw_id" {
  description = "ID of the Internet Gateway."
  value       = aws_internet_gateway.main.id
}

# NAT Gateway
output "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  value       = aws_nat_gateway.main.id
}

output "nat_eip_id" {
  description = "Elastic IP ID associated with the NAT Gateway."
  value       = aws_eip.nat.id
}

# Route Tables
output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the private route table."
  value       = aws_route_table.private.id
}

output "database_route_table_id" {
  description = "ID of the database route table."
  value       = aws_route_table.database.id
}