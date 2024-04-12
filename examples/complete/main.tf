terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.0.0"
    }
  }
}

resource "random_string" "identifier" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}

module "this" {
  source                  = "../../"
  git                     = "terraform-aws-kms"
  name                    = "alias/test-${random_string.identifier.result}"
  deletion_window_in_days = 7
}
