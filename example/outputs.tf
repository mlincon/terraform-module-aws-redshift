resource "local_file" "HOST" {
  filename = "${path.module}/secrets/host.txt"
  content  = module.redshift.host
}

resource "local_file" "DB_NAME" {
  filename = "${path.module}/secrets/db_name.txt"
  content  = module.redshift.db_name
}

resource "local_file" "DB_PORT" {
  filename = "${path.module}/secrets/db_port.txt"
  content  = module.redshift.db_port
}

resource "local_file" "DB_USER" {
  filename = "${path.module}/secrets/db_user.txt"
  content  = var.redshift_master_username
}

resource "local_file" "DB_PASSWORD" {
  filename = "${path.module}/secrets/db_password.txt"
  content  = var.redshift_master_password
}

resource "local_file" "IAM_ARN" {
  filename = "${path.module}/secrets/iam_arn.txt"
  content  = module.redshift.iam_role_arn
}