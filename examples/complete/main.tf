provider "aws" {
  region = "us-east-1"
}

resource "random_string" "identifier" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

module "this" {
  source                  = "../../"
  git                     = "terraform-aws-kms"
  name                    = "alias/test-${random_string.identifier.result}"
  deletion_window_in_days = 7
  account_actions = [
    {
      account = 912455136424,
      actions = ["kms:Encrypt"]
    },
  ]
}