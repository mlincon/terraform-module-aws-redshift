# Redshift VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = var.default_tags
}


# Attach Internet Gateway to the above VPC so that it's accessible from internet
# This will allow instances and devices outside the VPC to connect to database through the cluster endpoint
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}

# Open default Redshift port
# Allow ingress only from my IPv4 address

# here we define the ingress rule in a separate resource instead of using an inline block in the aws_security_group resource
# in order to avoid errors resulting from routing rules conflict as a result of mixing both inline blocks and separate resources
# when creating a modules it is preferrable to use a separate resource instead of inline block
resource "aws_security_group" "sg" {
  depends_on = [aws_vpc.vpc]
  
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}

resource "aws_security_group_rule" "allow_http_inbound"{
  type = "ingress"
  security_group_id = aws_security_group.sg.id
  from_port   = 5439
  to_port     = 5439
  protocol    = "tcp"
  cidr_blocks = [local.sg_ingress_cidr]
  description = "Redshift_port"
}


# Subnets
# Create two subnets to use when creating Redshift subnet group
# Instead of hard-coding the number of subnets and the corresponding CIDRs,
# ... use variables to set the number of subnets where the max number is limited to the number of AZs
# ... have a fixed and variable part in the subnet CIDRs
# ... the variable part will change based on the subnet
resource "aws_subnet" "redshift_subnets" {
  depends_on = [aws_vpc.vpc]

  # create as many subnets as counts
  count = var.number_of_redshift_subnets

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(local.redshift_subnet_cidrs, count.index)
  availability_zone = element(local.redshift_subnet_azs, count.index)

  tags = var.default_tags
}


# create the redshift subnet group
# you create a cluster subnet group if you are provisioning your cluster in VPC
# Redshift creates the cluster on one of the subnets in the group
resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name = var.redshift_subnet_group_name

  # use splat expression to get the ids of all the subnets
  # https://www.terraform.io/docs/language/expressions/splat.html
  subnet_ids = aws_subnet.redshift_subnets[*].id

  tags = var.default_tags
}
