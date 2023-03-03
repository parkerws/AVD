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
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | The category for the Storage Account, StorageV2 is the default. Other options include FileStorage or BlobStorage. | `string` | n/a | yes |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | This defines the data replication type for the Storage Account. Options are LRS, ZRS, GRS, GZRS, RAGRS, and RAGZRS. | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | The tier of storage for this Storage Account. Options are Standard or Premium. | `string` | n/a | yes |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | If network rules are used, this will be the default action used for connections not matching existing rules. Allow or Deny are the options. | `string` | n/a | yes |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | A setting to require that communication use SSL (HTTPS) when accessing the Storage Account. The default is true. | `string` | `true` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | A second layer of optional encryption, the default is true. | `bool` | `true` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | A list of IPs or CIDR blocks that are permitted to access the Storage Account. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Region the resource is located in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the Storage Account. 24 character max, all lowercase letters and numbers, no spaces, dashes, or special characters. The name must also be globally unique across all Microsoft customers. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Resource Group the Storage Account is placed in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The collection of tags to add to the resource. | `map` | n/a | yes |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | A list of subnet IDs that are permitted to access the Storage Account. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The primary connection string for the Storage Account. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the Storage Account (normally stored in a key vault). |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | Thb blob storage url endpoint for the Storage Account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Storage Account. |
<!-- END_TF_DOCS -->