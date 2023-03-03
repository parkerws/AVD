
locals {
  hub_to_spoke = length("${azurerm_virtual_network.vnet.name}-to-${var.hub_vnet_name}") > 80 ? "hub-to-${azurerm_virtual_network.vnet.name}" : "${var.hub_vnet_name}-to-${azurerm_virtual_network.vnet.name}"
  spoke_to_hub = length("${azurerm_virtual_network.vnet.name}-to-${var.hub_vnet_name}") > 80 ? "${azurerm_virtual_network.vnet.name}-to-hub" : "${azurerm_virtual_network.vnet.name}-to-${var.hub_vnet_name}"
}


// Create Resource Group(s)

### Create new Azure networking resources
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.name_root}-${var.vnet_name}-${replace(var.vnet_address_space, "/", "_")}"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.vnet_address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags
  # lifecycle {
  #   ignore_changes = [tags["deployment-date"]]
  # }
}



resource "azurerm_subnet" "spoke" {
  count                                          = length(var.subnet_list)
  name                                           = "sub-${var.name_root}-${var.subnet_list[count.index]["subnet_name"]}-${replace(var.subnet_list[count.index]["prefix"], "/", "_")}"
  address_prefixes                               = [var.subnet_list[count.index].prefix]
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  resource_group_name                            = var.resource_group_name
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  depends_on                                     = [azurerm_virtual_network.vnet]

}



resource "azurerm_network_security_group" "default_nsg_spoke" {
  count               = length(var.subnet_list)
  name                = "nsg-${var.name_root}-${var.subnet_list[count.index]["subnet_name"]}-${replace(var.subnet_list[count.index]["prefix"], "/", "_")}-default"
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on          = [azurerm_virtual_network.vnet]

  dynamic "security_rule" {
    for_each = var.subnet_list[count.index]["nsg_map"]
    content {
      name                       = "rule-${var.name_root}-${security_rule.value.name}"
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_ranges    = security_rule.value.destination_port_ranges
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags     = var.tags
}



resource "azurerm_subnet_network_security_group_association" "spoke" {
  count                     = length(var.subnet_list)
  subnet_id                 = azurerm_subnet.spoke[count.index].id
  network_security_group_id = azurerm_network_security_group.default_nsg_spoke[count.index].id
  depends_on = [
    azurerm_subnet.spoke,
    azurerm_network_security_group.default_nsg_spoke,
  ]
}


// UDR
# resource "azurerm_route_table" "to_hub" {
#   #count                         = length(var.subnet_list)
#   name                          = "rt-${var.name_root}-${var.vnet_name}-${var.route_table_name}"
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   disable_bgp_route_propagation = var.disable_bgp_propagation # false == Inject bgp to spoke, True == TURN OFF BGP
#   tags                          = var.tags
# }

# resource "azurerm_route" "all_traffic" {
#   count                  = length(var.hub_routes)
#   name                   = "${replace(var.hub_routes[count.index], "/", "_")}-hub-route"
#   resource_group_name    = var.resource_group_name
#   route_table_name       = azurerm_route_table.to_hub.name
#   address_prefix         = var.hub_routes[count.index]
#   next_hop_type          = "VirtualAppliance"
#   next_hop_in_ip_address = var.firewall_ip
# }

# resource "azurerm_subnet_route_table_association" "to_hub" {
#   count          = length(var.subnet_list)
#   subnet_id      = azurerm_subnet.spoke[count.index].id
#   route_table_id = azurerm_route_table.to_hub.id
# }




//////////////////////////////////////////////////
///////////////////  Peering  ///////////////////
////////////////////////////////////////////////


resource "azurerm_virtual_network_peering" "spokeToHub" {
  name                         = local.spoke_to_hub
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
  use_remote_gateways   = false #var.use_remote_gateways # alwasy true #"false" is for lab or no vng
}

# DevOps pipeline is limited to one subscription - hub cannot be configured currently
resource "azurerm_virtual_network_peering" "hubToSpoke" {
  name                         = local.hub_to_spoke
  resource_group_name          = var.hub_vnet_rg
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  allow_gateway_transit = false #change to true if you dont use vwwan
  use_remote_gateways   = false

}


/*
resource "azurerm_ip_group" "vpc_cidr" {
  name                = "${var.name_root}-ipgrp-vnet-${var.vnet_name}${replace(var.vnet_address_space, "/", "_")}"
  location            = var.location
  resource_group_name = var.hub_vnet_rg
  cidrs = [var.vnet_address_space]
  tags = var.tags
  provider = azurerm.hub
}
*/