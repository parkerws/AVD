#Workspace
resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.rg_name

  friendly_name = var.workspace_name

}


#Hostpool
resource "azurerm_virtual_desktop_host_pool" "avd_hp" {
  name                = var.host_pool_name
  location            = var.location
  resource_group_name = var.rg_name

  type                             = var.host_pool_type
  load_balancer_type               = var.load_balancer_type
  custom_rdp_properties            = "audiocapturemode:i:1;camerastoredirect:s:*;use multimon:i:0"
  start_vm_on_connect              = false
  personal_desktop_assignment_type = var.load_balancer_type == "Persistent" ? "Automatic" : null
  maximum_sessions_allowed         = var.load_balancer_type != "Persistent" ? 20 : null

}

#Generates host pool token
resource "azurerm_virtual_desktop_host_pool_registration_info" "reg_token" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.avd_hp.id
  expiration_date = timeadd(timestamp(), "2h")
}

#App Group (desktop)
resource "azurerm_virtual_desktop_application_group" "desktop_app_group" {
  name                = var.app_group_name
  location            = var.location
  resource_group_name = var.rg_name

  type          = "Desktop"
  host_pool_id  = azurerm_virtual_desktop_host_pool.avd_hp.id
  friendly_name = var.app_group_name
  description   = "Desktop Application Group"
}


#Associate desktop group to workspace
resource "azurerm_virtual_desktop_workspace_application_group_association" "workspaceremoteapp" {
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
  application_group_id = azurerm_virtual_desktop_application_group.desktop_app_group.id
}
