provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "fs-bucket-wordpress"
    key            = "Wordpress_Infra/terrafrom.tfstate"
    region         = "ap-south-1"
  }
}


