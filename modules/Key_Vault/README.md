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
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Region the resource is located in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the Key Vault. | `string` | n/a | yes |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The AAD Object\_ID for a user or principal to be used in the access control list of the Key Vault. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Resource Group the Key Vault is placed in. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The sku for the Key Vault, options are Standard or Premium. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The collection of tags to add to the resource. | `map(string)` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | The ID for the tenant. (equal to client\_config.tenant\_id) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Key Vault. |
| <a name="output_uri"></a> [uri](#output\_uri) | The URI of the Key Vault, used for performing operations on keys and secrets. |
<!-- END_TF_DOCS -->