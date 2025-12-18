module "eks" {
source = "terraform-aws-modules/eks/aws"
version = "20.8.4"


cluster_name = "${var.project_name}-cluster"
cluster_version = "1.29"


vpc_id = aws_vpc.this.id
subnets = aws_subnet.private[*].id


eks_managed_node_groups = {
default = {
instance_types = ["t3.medium"]
desired_size = 2
min_size = 1
max_size = 3
}
}
}