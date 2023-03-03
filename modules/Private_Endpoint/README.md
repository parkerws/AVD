# This module builds an Azure private endpoint


### The following arguments are required to run this module

- name - (Required) Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created.

- resource_group_name - (Required) Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created.

- location - (Required) The supported Azure location where the resource exists. Changing this forces a new resource to be created.

- subnet_id - (Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created.

- private_dns_zone_group - (Optional) A private_dns_zone_group block as defined below.

- private_service_connection - (Required) A private_service_connection block as defined below.

- tags - (Optional) A mapping of tags to assign to the resource.

- is_manual_connection - (Required) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created.

- private_connection_resource_id - (Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. Changing this forces a new resource to be created.

- subresource_names - (Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Changing this forces a new resource to be created.

-private_dns_zone_ids - - (Required) Specifies the list of Private DNS Zones to include within the private_dns_zone_group.



### To run this module 


```



module "endpoint" {
  source              = "./private-endpoint"
  name                = "myendpoint"
  location            = var.location
  resource_group_name = module.rg.name
  subnet_id           = module.network.id
  private_connection_resource_id = var.private_connection_resource_id
  subresource_names              = var.subresource_names
  is_manual_connection           = var.is_manual_connection
  request_message                = var.request_message
  tags                           = var.tags

}



```


### Useful links

[Link to Terraform page](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) 

[Link for Subresource names](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview) 
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
| [azurerm_private_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Does the Private Endpoint require manual approval from the owner of the resource the endpoint will be used with? | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Region the resource is located in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name for the Private Endpoint. | `string` | n/a | yes |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | The ID of the resource that will use this Private Endpoint. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Resource Group the Private Endpoint is placed in. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet to draw the Private IP from. | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | A list of sub-resources the Endpoint is permitted to connect to. The list of options is long but some examples are sqlServer, blob, or dfs. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The collection of tags to add to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Private Endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Private Endpoint. |
<!-- END_TF_DOCS -->