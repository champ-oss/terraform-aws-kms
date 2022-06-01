output "key_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#key_id"
  value       = aws_kms_key.this.key_id
}

output "arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#arn"
  value       = aws_kms_key.this.arn
}