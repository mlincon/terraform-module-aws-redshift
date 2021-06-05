module "redshift" {
  source = "git@github.com:mlincon/terraform-module-aws-redshift.git"

  region       = var.region
  default_tags = var.default_tags

  vpc_cidr_block              = var.vpc_cidr_block
  number_of_redshift_subnets  = var.number_of_redshift_subnets
  redshift_subnet_group_name  = var.redshift_subnet_group_name
  redshift_role_name          = var.redshift_role_name
  redshift_cluster_identifier = var.redshift_cluster_identifier

  redshift_database_name   = var.redshift_database_name
  redshift_master_username = var.redshift_master_username
  redshift_master_password = var.redshift_master_password
  redshift_node_type       = var.redshift_node_type
  redshift_cluster_port    = var.redshift_cluster_port
  redshift_cluster_type    = var.redshift_cluster_type
  redshift_number_of_nodes = var.redshift_number_of_nodes
}