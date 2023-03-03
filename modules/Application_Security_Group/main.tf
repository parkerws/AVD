
locals {
  nic_count = length(var.nic_list)
}

## Application Security Group
resource "azurerm_application_security_group" "asg" {
  name = var.asg_name
  location = var.location
  resource_group_name = var.rg_name
}

## Application Security Group Association
resource "azurerm_network_interface_application_security_group_association" "asg_association" {
  count = local.nic_count
  network_interface_id = var.nic_list[count.index]
  application_security_group_id = azurerm_application_security_group.asg.id
}