terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "suresh-vadde"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}