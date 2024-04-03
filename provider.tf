
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27" # Lock the version to ensure consistent behavior.
    }
  }

  required_version = ">= 0.14.9" # Ensure you are using a Terraform version that supports your configuration.
}

provider "aws" {
  region = "us-west-1"
}
