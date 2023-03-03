

locals {
  subnetlist = [
    {
      subnet_name = ""
      prefix      = "10.10.0.0/25"
      nsg_map = [{
        name                       = "from-all"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "443", "3389", "22"]
        destination_port_range     = ""
        source_address_prefix      = "*"
        destination_address_prefix = "*"

      }]
    }
  ]
}

module "spoke_networking" {

  source                  = "../modules/Network_Spoke"
  tags                    = { "tag1" : "example1", "tag2" : "example2" }
  use_remote_gateways     = false
  disable_bgp_propagation = false #False will push bgp into the spoke
  name_root               = "avd"
  subnet_list             = local.subnetlist
  resource_group_name     = module.resource_group.name
  location                = "eastus2"
  vnet_name               = "vnet-avd-parkdevlab"
  vnet_address_space      = "10.10.0.0/24"
  hub_routes              = ["0.0.0.0/0"]
  dns_servers             = ["10.0.0.4"]
  firewall_ip             = "10.1.1.4"
  hub_vnet_rg             = "rg-parkdevlab-identity"
  hub_vnet_name           = "vnet-identity-VNet"
  hub_vnet_id             = "/subscriptions/88f5201f-8646-4fc6-ad6c-84a511e43b16/resourceGroups/rg-parkdevlab-identity/providers/Microsoft.Network/virtualNetworks/vnet-identity-VNet"
}

module "resource_group" {
  source              = "../modules/Resource_Group"
  location            = "eastus2"
  resource_group_name = "rg-avd-vnet"
  tags                = { "tag1" : "example1", "tag2" : "example2" }
}