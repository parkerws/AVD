resource "azurerm_storage_account" "sa" {
  name                              = var.name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  account_kind                      = var.account_kind
  enable_https_traffic_only         = var.enable_https_traffic_only
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  tags                              = var.tags
  /*
  network_rules {
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  */
}

resource "azurerm_storage_share" "fslogix_share" {
  name                 = var.share_name
  storage_account_name = azurerm_storage_account.sa.name
  quota = var.file_share_quota
  depends_on = [
    azurerm_storage_account.sa
  ]
}

data "azurerm_role_definition" "storage_role" {
  name = "Storage File Data SMB Share Contributor"
}

resource "azurerm_role_assignment" "azure_files_role" {
  scope              = azurerm_storage_account.sa.id
  role_definition_id = data.azurerm_role_definition.storage_role.id
  principal_id       = var.aad_group_fslogix_id
}