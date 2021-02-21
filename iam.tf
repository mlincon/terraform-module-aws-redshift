# create a IAM role for Redshift and assume service role
# Redshift can then perform any tasks granted by the permission policies assigned to the role

# first read the policy document from the template JSON file and provide Redshift as input
data "template_file" "policy" {
  template = file("assume_role_policy.json")
  
  vars = {
      aws_services_list = ["redshift.amazonaws.com"]
  }
}