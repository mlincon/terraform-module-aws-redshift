resource "aws_redshift_cluster" "redshift_cluster" {
  depends_on = [
    aws_vpc.vpc,
    aws_security_group.sg,
    aws_redshift_subnet_group.redshift_subnet_group,
    aws_iam_role.redshift_role
  ]

  cluster_identifier        = var.redshift_cluster_identifier
  database_name             = var.redshift_database_name
  master_username           = var.redshift_master_username
  master_password           = var.redshift_master_password
  node_type                 = var.redshift_node_type
  cluster_type              = var.redshift_cluster_type
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  skip_final_snapshot       = var.redshift_skip_final_snapshot
  iam_roles                 = [aws_iam_role.redshift_role.arn]
  publicly_accessible       = var.redshift_publicly_accessible

  tags = var.default_tags
}