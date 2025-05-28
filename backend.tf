terraform {
  backend "s3" {
    bucket = "postech-soat10-bucket2"
    key    = "github-actions-fiap/db/terraform.tfstate"

    region  = "us-west-2"
    encrypt = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
