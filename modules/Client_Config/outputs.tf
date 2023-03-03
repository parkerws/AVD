output "client_id" {
  description = "The will return the client ID of the service principal running the Terraform code. This is the same as the Application ID for registered applications."
  value       = data.azurerm_client_config.current.client_id
}

output "tenant_id" {
  description = "This will return the tenant_id (GUID) for the current tenant."
  value       = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  description = "This will return the subscription_id (GUID) for the current subscription."
  value       = data.azurerm_client_config.current.subscription_id
}

output "object_id" {
  description = "This is the unique (GUID) object_id of the service principal running the Terraform code."
  value       = data.azurerm_client_config.current.object_id
}