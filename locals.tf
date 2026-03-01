locals {
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = true
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

    az_names = slice(data.aws_availability_zones.available.names, 0, 2)
    az_cidr_map = zipmap(local.az_names, var.public_subnet_cidrs)

    public_subnets = {
        for az, cidr in local.az_cidr_map : az => {
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
}