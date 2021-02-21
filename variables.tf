variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
}

variable "profile" {
  type        = string
  description = "AWS profile"
  default     = "default"
}

variable "credentials_file" {
  type        = string
  description = "Path to the AWS credentials file"
  default     = "~/.aws/credentials"
}

variable "default_tags" {
  type        = map(any)
  description = "Default tags in key-value pairs"
  default = {
    Name : "terraform-custom-redshift-module"
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC associated with Redshift"
  default     = "10.0.0.0/16"
}

variable "number_of_redshift_subnets" {
  type        = number
  description = "The number of subsets for redshift cluster"
  default     = 2
}

variable "redshift_subnet_group_name" {
  type        = string
  description = "The name of the Redshift subnet group"
  default     = "redshift-subnet-group"
}

variable "redshift_role_name" {
  type        = string
  description = "The name of the Redshift IAM role"
  default     = "redshift-role"
}

variable "redshift_cluster_identifier" {
  type        = string
  description = "The name of the cluster identifier"
  default     = "redshift-cluster"
}

variable "redshift_database_name" {
  type        = string
  description = "The name of the first database to be created when the cluster is created"
  default     = "dev"
}

variable "redshift_master_username" {
  type        = string
  description = "Username for the master DB user"
  default     = "awsuser"
}

variable "redshift_master_password" {
  type        = string
  description = "Password for the master DB user"
  default     = "A-very-weak-password!1"
}

variable "redshift_node_type" {
  type        = string
  description = "The node type to be provisioned for the cluster"
  default     = "dc2.large"
}

variable "redshift_cluster_type" {
  type        = string
  description = "The cluster type to use. Either single-node or multi-node"
  default     = "single-node"
}

variable "redshift_cluster_port" {
  type        = number
  description = "The port number on which the cluster accepts incoming connections"
  default     = 5439
}

variable "redshift_skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. If true , a final cluster snapshot is not created"
  default     = true
}

variable "redshift_publicly_accessible" {
  type        = bool
  description = "If true, the cluster can be accessed from a public network"
  default     = true
}