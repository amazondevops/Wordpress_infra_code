variable "region" {
  description = "ap-south-1"
  default = "ap-south-1"
}
variable "cluster_name" {
  description = "Name of the EKS cluster"
  #default = "fs_cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  #default = "fs_nodegroup"
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS node group"
  #default = "arn:aws:iam::980783347387:role/Admin_Role"
}
variable "eks_role_arn" {
  description = "ARN of the IAM role for EKS node group"
  #default = "arn:aws:iam::980783347387:role/Admin_Role"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where the EKS nodes will be launched"
  #default = [ "subnet-0ee23c429d1a0a174", "subnet-05c9e5a82308f4948","subnet-0414ed5cbf12036b5" ]
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS node group"
  #default = 2
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS node group"
  #default = 4
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS node group"
  #default = 2
}
