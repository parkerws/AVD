
data "azurerm_image" "custom" {
  count = var.custom_image_enabled ? 1 : 0
  name                = var.custom_image_name
  resource_group_name = var.custom_image_resource_group_name
}

#build Session Host NIC
resource "azurerm_network_interface" "avd_host_nic" {
  name                = "${var.vm_name}-${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.avd_rg
  count               = var.vm_count

  ip_configuration {
    name                          = "nic${count.index + 1}_config"
    subnet_id                     = var.avd_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

#Build Session Host VMs
resource "azurerm_virtual_machine" "avd_host" {
  count                         = var.vm_count
  name                          = "${var.vm_name}-${count.index + 1}"
  location                      = var.location
  resource_group_name           = var.avd_rg
  vm_size                       = var.vm_size
  network_interface_ids         = ["${azurerm_network_interface.avd_host_nic.*.id[count.index]}"]  
  delete_os_disk_on_termination = true


  storage_image_reference {
    publisher = var.custom_image_enabled ? null : var.image_publisher
    offer     = var.custom_image_enabled ? null : var.image_offer
    sku       = var.custom_image_enabled ? null : var.image_sku
    version   = var.custom_image_enabled ? null : var.image_version
    id        = var.custom_image_enabled ? data.azurerm_image.custom[count.index].id : null
  }

  storage_os_disk {
    name          = "${var.vm_name}-${count.index}"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "${var.vm_name}${count.index+1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}


#Domain-join Session Hosts
resource "azurerm_virtual_machine_extension" "domain_join" {
  count                      = var.vm_count
  name                       = "join-domain-${count.index + 1}"
  virtual_machine_id         = azurerm_virtual_machine.avd_host.*.id[count.index]
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true


  settings = <<SETTINGS
  {
  	"Name": "${var.domain}",
  	"OUPath": "${var.ou_path}",
  	"User": "${var.domainuser}@${var.domain}",
  	"Restart": "true",
  	"Options": "3"
  }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "${var.domainpassword}"
    }
PROTECTED_SETTINGS

  lifecycle {
    ignore_changes = [settings, protected_settings]
  }
}

#Run DSC on Session Hosts
resource "azurerm_virtual_machine_extension" "register_session_host" {
  count                      = var.vm_count
  name                       = "register-host-${count.index + 1}-avd-dsc"
  virtual_machine_id         = azurerm_virtual_machine.avd_host.*.id[count.index]
  publisher                  = "Microsoft.Powershell"
  type                       = "DSC"
  type_handler_version       = "2.73"
  auto_upgrade_minor_version = true
  settings                   = <<SETTINGS
  {
  	"ModulesUrl": "${var.artifactslocation}",
  	"ConfigurationFunction": "Configuration.ps1\\AddSessionHost",
  	"Properties": {
  		"hostPoolName": "${var.hostpoolname}"
  	}
  }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
    "properties": {
      "registrationInfoToken": "${var.regtoken}"
    }
  }
  PROTECTED_SETTINGS

  lifecycle {
    # create_before_destroy = true
    ignore_changes = [settings, protected_settings]
  }

  depends_on = [
    azurerm_virtual_machine_extension.domain_join,

  ]
}
