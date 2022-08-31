variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
}

variable "name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias#name"
  type        = string
}

variable "account_actions" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#policy"
  type        = list(object({ account = string, actions = list(string) }))
}

variable "deletion_window_in_days" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#deletion_window_in_days"
  type        = number
  default     = 30
}

variable "custom_policy" {
  type        = any
  description = "point to data.aws_iam_policy_document.custom.json"
  default     = null
}
