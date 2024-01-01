variable "region" {
  description = "ap-south-1"
  default = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default = "fs_cluster"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  default = "fs_nodegroup"
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS node group"
  default = "arn:aws:iam::980783347387:role/Admin_Role"
}
variable "eks_role_arn" {
  description = "ARN of the IAM role for EKS node group"
  default = "arn:aws:iam::980783347387:role/Admin_Role"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where the EKS nodes will be launched"
  default = [ "subnet-0ee23c429d1a0a174", "subnet-05c9e5a82308f4948","subnet-0414ed5cbf12036b5" ]
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS node group"
  default = 2
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS node group"
  default = 4
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS node group"
  default = 2
}

#######ECR VARIABLES#########


 
variable "repo_name" {
  description = "The application repository name."
  type        = string
  default = "fs_repo"
}
 
variable "app_environment" {
  description = "The application environment that image represents."
  type        = string
  default = "fs_dev"
}
 
variable "image_description" {
  description = "A meaningful description for the image."
  type        = string
  default = "fs_wp"
}
 
variable "image_scan" {
  description = "Defines if the image should be scanned for vulnerabilities on push."
  type        = bool
  default = true
}
 
variable "image_age" {
  description = "Delete images older than number of days."
  type        = number
  default = 15
}


