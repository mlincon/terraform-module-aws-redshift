variable "region" {
  type        = string
  description = "AWS region"
}

variable "profile" {
  type        = string
  description = "AWS profile"
}

variable "credentials_file" {
  type        = string
  description = "Path to the AWS credentials file"
}

variable "default_tags" {
  type        = map(any)
  description = "Default tags in key-value pairs"
}


variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC associated with Redshift"
}