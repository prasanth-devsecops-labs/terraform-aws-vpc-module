locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = true
  }

  vpc_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}"
    },
    var.vpc_tags
  )

  igw_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}"
    },
    var.igw_tags
  )

  az_names        = slice(data.aws_availability_zones.available.names, 0, 2)
  az_cidr_map_pub = zipmap(local.az_names, var.public_subnet_cidrs)
  # us-east-1a : 10.0.1.0/24
  # us-east-1b : 10.0.2.0/24
  public_subnets = {
    for az, cidr in local.az_cidr_map_pub : az => {
      cidr = cidr
      tags = merge(
        local.common_tags,
        {
          Name = "${var.project}-${var.environment}-public-${az}"
        },
        var.public_subnet_tags
      )
    }
  }

  az_cidr_map_private = zipmap(local.az_names, var.private_subnet_cidrs)
  private_subnets = {
    for az, cidr in local.az_cidr_map_private : az => {
      cidr = cidr
      tags = merge(
        local.common_tags,
        {
          Name = "${var.project}-${var.environment}-private-${az}"
        },
        var.private_subnet_tags
      )
    }
  }

  az_cidr_map_database = zipmap(local.az_names, var.database_subnet_cidrs)
  database_subnets = {
    for az, cidr in local.az_cidr_map_database : az => {
      cidr = cidr
      tags = merge(
        local.common_tags,
        {
          Name = "${var.project}-${var.environment}-database-${az}"
        },
        var.database_subnet_tags
      )
    }
  }

  public_route_table_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-public"
    },
    var.public_route_table_tags
  )

  private_route_table_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-private"
    },
    var.private_route_table_tags
  )

  database_route_table_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-database"
    },
    var.database_route_table_tags
  )

  eip_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-nat"
    },
    var.eip_tags
  )

  # Pick one subnet name to be the 'host' for shared resources like NAT
  primary_az = keys(local.public_subnets)[0]

  nata_gateway_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}"
    },
    var.nat_gateway_tags
  )

  vpc_peering_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-default"
    }
  )

}