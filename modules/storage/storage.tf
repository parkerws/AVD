#random string for storage account creation
resource "random_string" "random" {
  length  = 4
  upper   = false
  special = false
}

#Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "${random_string.random.id}users"
  resource_group_name      = azurerm_resource_group.avd_rg.name
  location                 = var.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
}