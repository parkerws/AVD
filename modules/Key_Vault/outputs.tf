output "id" {
  value       = azurerm_key_vault.key_vault.id
  description = "The ID of the Key Vault."
}

output "uri" {
  value       = azurerm_key_vault.key_vault.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}