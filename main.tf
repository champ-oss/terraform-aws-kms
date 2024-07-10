locals {
  tags = {
    git       = var.git
    cost      = "shared"
    creator   = "terraform"
    component = "kms"
  }
}

data "aws_caller_identity" "current" {
  count = var.enabled ? 1 : 0
}

resource "aws_kms_key" "this" {
  count                   = var.enabled ? 1 : 0
  policy                  = var.custom_policy != null ? var.custom_policy : data.aws_iam_policy_document.this[0].json
  tags                    = merge(local.tags, var.tags)
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "this" {
  count         = var.enabled ? 1 : 0
  name          = var.name
  target_key_id = aws_kms_key.this[0].key_id
}

data "aws_iam_policy_document" "this" {
  count = var.enabled ? 1 : 0

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
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current[0].account_id}:root"]
      type        = "AWS"
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}