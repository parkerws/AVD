

locals {
  subnetlist = [
    {
      subnet_name = ""
      prefix      = "10.0.0.0/25"
      nsg_map = [{
        name                       = "from*"
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
  providers = {
    azurerm.spoke = azurerm.spoke_main
    azurerm.hub   = azurerm.hub_main
  }
  source                  = "app.terraform.io/${org}/module-spoke/azurerm"
  tags                    = { "tag1" : "example1", "tag2" : "example2" }
  use_remote_gateways     = true
  disable_bgp_propagation = true #False will push bgp into the spoke
  name_prefix             = "name-pre"
  subnet_list             = local.subnetlist
  resource_group_name     = "rgname123"
  location                = "centralus"
  vnet_name               = "vnetname123"
  vnet_address_space      = "10.0.0.0/24"
  hub_routes              = ["0.0.0.0/0"]
  dns_servers             = []
  firewall_ip             = "10.1.1.4"
  hub_vnet_rg             = "rg-hub-vnet"
  hub_vnet_name           = "hub-vnet"
  hub_vnet_id             = "vnetid-1234r4tegkfdlsvj"
}
