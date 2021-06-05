variable "region" {
  type        = string
  description = "AWS region"
}

variable "default_tags" {
  type        = map(any)
  description = "Default tags in key-value pairs"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC associated with Redshift"
}

variable "number_of_redshift_subnets" {
  type        = number
  description = "The number of subsets for redshift cluster"
}

variable "redshift_subnet_group_name" {
  type        = string
  description = "The name of the Redshift subnet group"
}

variable "redshift_role_name" {
  type        = string
  description = "The name of the Redshift IAM role"
}

variable "redshift_cluster_identifier" {
  type        = string
  description = "The name of the cluster identifier"
}

variable "redshift_database_name" {
  type        = string
  description = "The name of the first database to be created when the cluster is created"
}

variable "redshift_master_username" {
  type        = string
  description = "Username for the master DB user"
}

variable "redshift_master_password" {
  type        = string
  description = "Password for the master DB user"
}

variable "redshift_node_type" {
  type        = string
  description = "The node type to be provisioned for the cluster"
}

variable "redshift_cluster_type" {
  type        = string
  description = "The cluster type to use. Either single-node or multi-node"
}

variable "redshift_number_of_nodes" {
  type        = number
  description = "The number of compute nodes in the cluster"
}

variable "redshift_cluster_port" {
  type        = number
  description = "The port number on which the cluster accepts incoming connections"
}

