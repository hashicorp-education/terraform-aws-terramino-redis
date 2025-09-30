# Terraform + Redis Terraform no-code module

This no-code module deploys [terramino-go](https://github.com/hashicorp-education/terramino-go) and Redis on a single AWS EC2 instance.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/instance) | resource |
| [aws_security_group.allow_web_traffic](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.allow_egress](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.allow_web](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/5.67.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `80` | no |
| <a name="input_waypoint_application"></a> [waypoint\_application](#input\_waypoint\_application) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | n/a |
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
