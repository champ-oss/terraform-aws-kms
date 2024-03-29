locals {
  tags = {
    git       = var.git
    cost      = "shared"
    creator   = "terraform"
    component = "kms"
  }
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {
  policy                  = var.custom_policy != null ? var.custom_policy : data.aws_iam_policy_document.this[0].json
  tags                    = merge(local.tags, var.tags)
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "this" {
  name          = var.name
  target_key_id = aws_kms_key.this.key_id
}

data "aws_iam_policy_document" "this" {
  count = 1

  dynamic "statement" {
    for_each = var.account_actions

    content {
      principals {
        identifiers = ["arn:aws:iam::${statement.value.account}:root"]
        type        = "AWS"
      }

      actions   = statement.value.actions
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = var.org_actions

    content {
      principals {
        identifiers = ["*"]
        type        = "AWS"
      }

      actions   = statement.value.actions
      resources = ["*"]

      condition {
        test     = "ForAnyValue:StringLike"
        variable = "aws:PrincipalOrgPaths"
        values   = [statement.value.org]
      }
    }
  }

  statement {
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}