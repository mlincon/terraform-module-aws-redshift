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
# get IPv4: https://stackoverflow.com/a/53782560/11868112
data "http" "myipv4" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sg" {
  depends_on = [aws_vpc.vpc]

  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myipv4.body)}/32"]
    description = "Redshift_port"
  }

  tags = var.default_tags
}


# Subnets
# Create two subnets to use when creating Redshift subnet group
# Instead of hard-coding the number of subnets and the corresponding CIDRs, we will 