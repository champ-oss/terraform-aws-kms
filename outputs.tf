output "key_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#key_id"
  value       = var.enabled ? aws_kms_key.this[0].key_id : ""
}

output "arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#arn"
  value       = var.enabled ? aws_kms_key.this[0].arn : ""
}