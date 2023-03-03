## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm.hub"></a> [azurerm.hub](#provider\_azurerm.hub) | ~> 3 |
| <a name="provider_azurerm.spoke"></a> [azurerm.spoke](#provider\_azurerm.spoke) | ~> 3 |

## Resources

| Name | Type |
|------|------|
| [azurerm_ip_group.vpc_cidr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ip_group) | resource |
| [azurerm_network_security_group.default_nsg_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_route.all_traffic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.to_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.to_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.hubToSpoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spokeToHub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_nsg_name"></a> [default\_nsg\_name](#input\_default\_nsg\_name) | The name of the default Network Security Group. | `string` | `"anyany"` | no |
| <a name="input_disable_bgp_propagation"></a> [disable\_bgp\_propagation](#input\_disable\_bgp\_propagation) | Enables BGP from hub if set to false, if set to true will disable BGP to the spoke. | `bool` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List the DNS servers that can be applied to the VNET. (Optional) | `list(string)` | n/a | yes |
| <a name="input_enforce_private_link_endpoint_network_policies"></a> [enforce\_private\_link\_endpoint\_network\_policies](#input\_enforce\_private\_link\_endpoint\_network\_policies) | Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. | `bool` | `true` | no |
| <a name="input_firewall_ip"></a> [firewall\_ip](#input\_firewall\_ip) | IP that traffic should be forwarded to to reach firewalls. | `string` | n/a | yes |
| <a name="input_hub_routes"></a> [hub\_routes](#input\_hub\_routes) | List the routes that can be applied to the VNET. (Optional) | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_hub_vnet_id"></a> [hub\_vnet\_id](#input\_hub\_vnet\_id) | The hub VNET ID. | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | Name of the hub VNET, used for naming peering. | `string` | n/a | yes |
| <a name="input_hub_vnet_rg"></a> [hub\_vnet\_rg](#input\_hub\_vnet\_rg) | Name of the hub VNET resource group. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The desired Azure region to be deployed to. | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String that is used for the first part of the name. Should be created via tags | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The desired resource group name to be used for the deployed networking components. | `string` | n/a | yes |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | The name of the Route table. | `string` | `"default"` | no |
| <a name="input_subnet_list"></a> [subnet\_list](#input\_subnet\_list) | A list of subnets to be attached to the VNET. The variable should include a list of maps with the subnetName and prefix included. | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Required tags with values that will be attached to deployed resources. Passed over as a map type. | `map(string)` | n/a | yes |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Will the spoke use the virtual network gateway? Set to yes, unless there is not a vng. | `bool` | `true` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space allocated to the VNET. | `any` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the VNET. | `string` | `"vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_group"></a> [ip\_group](#output\_ip\_group) | IP Group for created in the Hub. |
| <a name="output_nsg_list"></a> [nsg\_list](#output\_nsg\_list) | List of spoke NSGs. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | List of spoke subnets IDs. |
| <a name="output_subnet_info"></a> [subnet\_info](#output\_subnet\_info) | list of Maps of all info from subnets. List(map) |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | Spoke Vnet ID. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | Spoke Vnet Name. |
| <a name="output_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#output\_vnet\_resource\_group\_name) | Spoke vnet resource group name. |
| <a name="output_vpc_ip_group_id"></a> [vpc\_ip\_group\_id](#output\_vpc\_ip\_group\_id) | IP Group for the VPC cidr, used on firewalls for rules. |