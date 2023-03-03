<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.resource_group_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Denotes the location of the resource group. e.g. centralus, eastus2 | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input\_lock) | Applies a lock to the RG if set to true. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Denotes the name of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The collection of tags to add to the resource group. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Resource Group. |
| <a name="output_location"></a> [location](#output\_location) | The region containing the Resource Group. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Resource Group. |
<!-- END_TF_DOCS -->