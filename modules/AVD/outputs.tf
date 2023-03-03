output "registration_token" {
  description = "Registration token for joining session hosts to a host pool."
  value       = azurerm_virtual_desktop_host_pool_registration_info.reg_token.token
}

output "workspace_name" {
  description = "Name of AVD workspace"
  value       = azurerm_virtual_desktop_workspace.workspace.name
}

output "workspace_id" {
  description = "value"
  value       = azurerm_virtual_desktop_workspace.workspace.id
}

output "hostpool_name" {
  description = "Name of deployed Host Pool"
  value       = azurerm_virtual_desktop_host_pool.avd_hp.name
}

output "hostpool_id" {
  description = "ID of AVD Hostpool"
  value       = azurerm_virtual_desktop_host_pool.avd_hp.id
}

output "host_pool_reg_token" {
  description = "AVD Host Pool registration token"
  value       = azurerm_virtual_desktop_host_pool_registration_info.reg_token.token
}

output "desktop_app_group_name" {
  description = "Name of deployed AVD Desktop App Group"
  value       = azurerm_virtual_desktop_application_group.desktop_app_group.name
}

output "desktop_app_group_id" {
  description = "Name of deployed AVD Desktop App Group"
  value       = azurerm_virtual_desktop_application_group.desktop_app_group.id
}