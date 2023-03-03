output "connection_string" {
  description = "The primary connection string for the Storage Account."
  value       = azurerm_storage_account.sa.primary_connection_string
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.sa.name
}

output "primary_access_key" {
  description = "The primary access key for the Storage Account (normally stored in a key vault)."
  value       = azurerm_storage_account.sa.primary_access_key
}

output "primary_blob_endpoint" {
  description = "Thb blob storage url endpoint for the Storage Account."
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}

output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.sa.id
}

output "name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.sa.name
}