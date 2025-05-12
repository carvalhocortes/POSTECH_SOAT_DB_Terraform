terraform {
  backend "s3" {
    bucket         = "postech-soat-db-terraform-bucket"
    key            = "s3-github-actions/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
