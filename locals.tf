locals {
  # set security group ingress CIDR to my ipv4 address
  sg_ingress_cidr = "${chomp(data.http.myipv4.body)}/32"

  # save the data of AZs in a local variable so that it can be modified if required
  availability_zones = data.aws_availability_zones.available_azs.names

  # create a fixed part for CIDR-subnets from the VPC CIDR block
  subnet_cidr_fixed_part = join(".", slice(split(".", var.vpc_cidr_block), 0, 2)) # 10.0 from 10.0.0.0/16
}

locals {
  # get the first n AZs
  redshift_subnet_azs = slice(local.availability_zones, 0, var.number_of_redshift_subnets)

  # subnet CIDRs
  # output should be 10.0.1.0/24 and 10.0.2.0/24
  redshift_subnet_cidrs = [
    for az in local.availability_zones:
      "${local.subnet_cidr_fixed_part}.${index(local.availability_zones, az) + 1}.0/24"
      if index(local.availability_zones, az) < var.number_of_redshift_subnets
  ]
} 