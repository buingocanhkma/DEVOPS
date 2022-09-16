terraform {
  #required_version = "~> 0.12.6"

  required_providers {
    # https://github.com/terraform-providers/terraform-provider-aws/releases/latest
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  access_key = "AKIAQDV6LAORMIM6I75B"
  secret_key = "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"
}

#terraform {
#  backend "s3" {
#    bucket = "ecsworkshopbucket"
#    key    = "state/terraform.tfstate"
#    region = "us-east-1"
#  }
#}