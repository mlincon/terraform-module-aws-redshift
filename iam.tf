# create a IAM role for Redshift and assume service role
# Redshift can then perform any tasks granted by the permission policies assigned to the role

# first read the policy document from the template JSON file and provide Redshift as input
locals {
  aws_services = ["redshift.amazonaws.com"]
}

data "template_file" "redshift_iam_policy" {
  # path.module returns the filesystem path of the module where the expression is defined
  template = file("${path.module}/assume_role_policy.json")

  vars = {
    aws_services_list = join(", ", local.aws_services)
  }
}

# render the policy json file
resource "aws_iam_role" "redshift_role" {
  name               = var.redshift_role_name
  assume_role_policy = data.template_file.redshift_iam_policy.rendered

  tags = var.default_tags
}


# assign permission policy to the role
# since we'll be using AWS managed policies, we will use the aws_iam_role_policy_attachment resource
# if we implemented the policy in terraform (i.e. created ourselves), 
# we would have used the resource aws_iam_role_policy at first

# https://stackoverflow.com/a/62281561/11868112
# https://www.terraform.io/docs/language/meta-arguments/for_each.html
resource "aws_iam_role_policy_attachment" "redshift_role_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])

  role       = aws_iam_role.redshift_role.id
  policy_arn = each.value
}