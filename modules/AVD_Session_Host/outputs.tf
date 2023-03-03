output "session_host_id" {
  description = "IDs of session host VMs"
  value       = azurerm_virtual_machine.avd_host.*.id
}

output "session_host_name" {
  description = "Names of session host VMs"
  value       = azurerm_virtual_machine.avd_host.*.name
}

output "session_host_nic_name" {
  description = "Names of session host NICs"
  value       = azurerm_network_interface.avd_host_nic.*.name
}

output "session_host_nic_id" {
  description = "ID of session host NICs"
  value       = azurerm_network_interface.avd_host_nic.*.id
}

