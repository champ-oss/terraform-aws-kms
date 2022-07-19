# terraform-aws-kms

A Terraform module for creating an AWS KMS key

[![.github/workflows/module.yml](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/module.yml/badge.svg?branch=main)](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/module.yml)
[![.github/workflows/lint.yml](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/lint.yml)
[![.github/workflows/sonar.yml](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/sonar.yml/badge.svg)](https://github.com/champ-oss/terraform-aws-kms/actions/workflows/sonar.yml)

[![SonarCloud](https://sonarcloud.io/images/project_badges/sonarcloud-black.svg)](https://sonarcloud.io/summary/new_code?id=terraform-aws-kms_champ-oss)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=terraform-aws-kms_champ-oss&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=terraform-aws-kms_champ-oss)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=terraform-aws-kms_champ-oss&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=terraform-aws-kms_champ-oss)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=terraform-aws-kms_champ-oss&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=terraform-aws-kms_champ-oss)

## Example Usage

See the `examples/` folder

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_actions"></a> [account\_actions](#input\_account\_actions) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#policy | `list(object({ account = string, actions = list(string) }))` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#deletion_window_in_days | `number` | `30` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias#name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#arn |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#key_id |
<!-- END_TF_DOCS -->


## Features



## Contributing


