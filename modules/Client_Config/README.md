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
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | The will return the client ID of the service principal running the Terraform code. This is the same as the Application ID for registered applications. |
| <a name="output_object_id"></a> [object\_id](#output\_object\_id) | This is the unique (GUID) object\_id of the service principal running the Terraform code. |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | This will return the subscription\_id (GUID) for the current subscription. |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | This will return the tenant\_id (GUID) for the current tenant. |
<!-- END_TF_DOCS -->