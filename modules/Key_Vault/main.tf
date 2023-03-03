
resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tenant_id                       = var.tenant
  sku_name                        = var.sku_name
  tags                            = var.tags
  purge_protection_enabled        = true
  soft_delete_retention_days      = 7

  access_policy {
    tenant_id = var.tenant
    object_id = var.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
    ]

    key_permissions = [
      "Backup",
      "Create",
      "Decrypt",
      "Delete",
      "Encrypt",
      "Get",
      "Import",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Sign",
      "UnwrapKey",
      "Update",
      "Verify",
      "WrapKey",
    ]

    storage_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
    ]

    certificate_permissions = [
      "Backup",
      "Create",
      "Delete",
      "DeleteIssuers",
      "Get",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "Purge",
      "Recover",
      "Restore",
      "SetIssuers",
      "Update",
    ]
  }
  /* #Uncomment this section if you wish to restrict the Key Vault to specific subnets or CIDR ranges.
    network_acls {
      bypass                     = "AzureServices"
      default_action             = var.default_action
      ip_rules                   = var.ip_rules
      virtual_network_subnet_ids = var.virtual_network_subnet_ids
    }
*/
}

