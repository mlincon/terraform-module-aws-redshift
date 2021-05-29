#### Terraform Module for Redshift Cluster

The following set-up creates a Redshift cluster in a public VPC. Idea is to allow direct access programmatically or via a tool like DBeaver, pgAdmin, etc. Note that the cluster is initially blocked off from public access. The public access is achieved by creating a internet gateway and associating route tables to direct traffic to the subnet where the cluster is hosted.

A more secured approach would be to allow access to the Redshift cluster only via EC2 virtual machine, i.e. using our local machine we would connect to an EC2 via SSH and the then connect the EC2 to the DWH cluster.  

This module uses EC2-VPC set-up to control access to the Redshift cluster. We create and assign to the cluster our own VPC security group, which allows access only from our IP address. If no security group was created, the "default" security group would have been used.

To allow public access from the internet to the cluster, it is important that an internet gateway is attached to a route table and the route table is associated with the VPC subnet, where the cluster resides.

The module currently does not support Elastic IP.  

**Important**: The module takes master password via variable definition. I've not yet researched how to do it more securely.

#### Steps:
- Create a new VPC for our redshift cluster
- Define the default Security Group for our VPC and associate a routing table
- Create a couple of subnets for our cluster
- Create a Redshift Subnet Group for our cluster
- Create the IAM role that allows our cluster to read and write to S3
- Create the Redshift Cluster


#### Reference:
- [Terraforming and Connecting to an AWS Redshift Cluster](https://medium.com/faun/terraforming-and-connecting-to-your-aws-redshift-cluster-16f93ddd41cc)
- [Terraform AWS Dynamic Subsets](https://medium.com/prodopsio/terraform-aws-dynamic-subnets-455619dd1977)
- [Amazon Redshift cluster subnet groups](https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html)
- [How can I make a private Amazon Redshift cluster publicly accessible? (2020-11-09)](https://aws.amazon.com/premiumsupport/knowledge-center/redshift-cluster-private-public/)