## Steps:
- Creating a new VPC for our redshift cluster
- Defining the default Security Group for our VPC
- Creating a couple of subnets for our cluster
- Creating a Redshift Subnet Group for our cluster
- Creating the IAM role that allows our cluster to read and write to S3
- Creating the Redshift Cluster


##### Reference:
- [Terraforming and Connecting to an AWS Redshift Cluster](https://medium.com/faun/terraforming-and-connecting-to-your-aws-redshift-cluster-16f93ddd41cc)
- [Terraform AWS Dynamic Subsets](https://medium.com/prodopsio/terraform-aws-dynamic-subnets-455619dd1977)
- [Amazon Redshift cluster subnet groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html)