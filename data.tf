# get my IPv4: https://stackoverflow.com/a/53782560/11868112
data "http" "myipv4" {
  url = "http://ipv4.icanhazip.com"
}

# get the AZs available in the region configured in the provider
data "aws_availability_zones" "available_azs" {
  # filters out availability zones that currently experience outages
  state = "available"
}