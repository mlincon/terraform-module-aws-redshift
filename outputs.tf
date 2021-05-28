output "host" {
  value       = aws_redshift_cluster.redshift_cluster.endpoint
  description = "The Redshift connection endpoint"
}

output "db_name" {
  value       = aws_redshift_cluster.redshift_cluster.database_name
  description = "The name of the default database"
}

output "db_port" {
  value       = aws_redshift_cluster.redshift_cluster.port
  description = "The port the cluster responds to"
}

output "iam_role_arn" {
  value       = aws_iam_role.redshift_role.arn
  description = "The ARN specifying the role"
}
