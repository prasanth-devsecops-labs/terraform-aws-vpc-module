resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = local.vpc_final_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # association
  tags   = local.igw_final_tags
}

resource "aws_subnet" "public" {
  # count = length(var.public_subnet_cidrs)
  for_each                = local.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags                    = each.value.tags
}