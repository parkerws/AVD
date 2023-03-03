
output "nsg_list" {
  value       = azurerm_network_security_group.default_nsg_spoke.*
  description = "List of spoke NSGs."
}

output "subnet_id" {
  value       = azurerm_subnet.spoke.*.id
  description = "List of spoke subnets IDs."
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Spoke Vnet ID."
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Spoke Vnet Name."
}

output "vnet_resource_group_name" {
  value       = azurerm_virtual_network.vnet.resource_group_name
  description = "Spoke vnet resource group name."
}

output "subnet_info" {
  value       = azurerm_subnet.spoke.*
  description = "list of Maps of all info from subnets. List(map)"
}

/*
output "vpc_ip_group_id" {
  value = azurerm_ip_group.vpc_cidr.id
  description = "IP Group for the VPC cidr, used on firewalls for rules."
}

output "ip_group" {
  value = azurerm_ip_group.vpc_cidr
  description = "IP Group for created in the Hub."
}
*/