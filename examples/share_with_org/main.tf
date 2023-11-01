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
  org_actions = [
    {
      org     = "o-685x712345/*",
      actions = ["kms:Encrypt"]
    },
  ]
}