<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_endpoint.inbound_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |
| [aws_route53_zone.private_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_security_group.inbound_endpoint_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Providers

| Name | Version |
|------|---------|
| aws | >= 5.74.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_cidr\_blocks | List of CIDR blocks allowed to access the inbound endpoint (e.g., on-premises IP ranges) | `list(string)` | ```[ "0.0.0.0/0" ]``` | no |
| environment | The environment name (e.g., dev, stage, prod) | `string` | n/a | yes |
| subnet\_ids | List of subnet IDs for the inbound endpoint's IP addresses | `list(string)` | n/a | yes |
| vpc\_id | The VPC ID where the private hosted zone and inbound endpoint will be created | `string` | n/a | yes |
| zone\_name | The name of the private hosted zone (e.g., dev.lb.service) | `string` | `"dev.local.service"` | no |

## Outputs

| Name | Description |
|------|-------------|
| inbound\_endpoint\_arn | ARN of the Route 53 inbound resolver endpoint |
| inbound\_endpoint\_id | ID of the Route 53 inbound resolver endpoint |
| route53\_private\_zone\_id | ID of the Route 53 private hosted zone |
| route53\_private\_zone\_name | Name of the Route 53 private hosted zone |
<!-- END_TF_DOCS -->