provider "aws" {
  region  = var.region
  profile = var.profile

  shared_credentials_file = pathexpand(var.credentials_file)
}