provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

}


resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name

  node_role_arn = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [aws_eks_cluster.eks]
}

