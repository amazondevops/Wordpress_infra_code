module "eks" {
  source = "./eks"
  cluster_name = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn = var.node_role_arn
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
  eks_role_arn = var.eks_role_arn
  subnet_ids = var.subnet_ids
  region = var.region
  
}

resource "random_password" "master_password" {
  length  = 16
  special = false
}

resource "aws_ssm_parameter" "master_password" {
  name        = "/fs/rds/master_password"
  description = "Master password for the application"
  type        = "SecureString"
  value       = random_password.master_password.result

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


data "aws_ssm_parameter" "rds_password" {
  name           = "/fs/rds/master_password"  
  depends_on = [ aws_ssm_parameter.master_password ]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.0"

  identifier = "fs-db"
  engine                    = "mariadb"
  engine_version            = "10.6.14"
  create_db_parameter_group = "false"
  create_db_option_group    = "false"
  skip_final_snapshot       = "true"

  instance_class        = "db.t3.micro"
  allocated_storage     = 5
  max_allocated_storage = 10

  username = "admin"
  db_name  = "wordpressdb"
  password = data.aws_ssm_parameter.rds_password.value
  multi_az               = "true"
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = ["sg-015ab21c58a0675df"]
  tags = {
    Owner       = "user"
    Environment = "dev"
  }

}

###############


module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "fs-bucket-wordpress"
  acl    = "private"
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}


module "fs_repo" {
  source = "./ecr"
  repo_name = var.repo_name
  image_age = var.image_age
  image_scan = var.image_scan
  app_environment = var.app_environment
  image_description = var.image_description
  
}

