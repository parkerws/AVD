output "name" {
  description = "The name of the Resource Group."
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  description = "The region containing the Resource Group."
  value       = azurerm_resource_group.resource_group.location
}

output "id" {
  description = "The ID of the Resource Group."
  value       = azurerm_resource_group.resource_group.id
}