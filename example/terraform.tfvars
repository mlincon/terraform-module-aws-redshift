region = "eu-central-1"
default_tags = {
  Name : "project-name",
  project : "project-label"
}

vpc_cidr_block              = "10.0.0.0/16"
number_of_redshift_subnets  = 1
redshift_subnet_group_name  = "project-name"
redshift_role_name          = "project-name-redshift-role"
redshift_cluster_identifier = "project-name-cluster"
redshift_cluster_type       = "multi-node"
redshift_number_of_nodes    = 4
redshift_master_username    = "awsuser"
redshift_master_password    = "A-very-weak-password!1"

redshift_database_name = "dev"
redshift_node_type     = "dc2.large"
redshift_cluster_port  = 5439