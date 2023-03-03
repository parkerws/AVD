
module "platform_resource_group" {
  source = "../../../modules/Resource_Group"

  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

module "key_vault" {
  source = "../../../modules/Key_Vault"

  name                = var.key_vault_name
  resource_group_name = module.platform_resource_group.name
  location            = var.location
  sku_name            = var.key_vault_sku_name
  tenant              = var.tenant_id
  tags                = var.tags
  object_id           = var.kv_aad_object_id


}

module "storage_account" {
  source = "../../../modules/Storage_Account"

  name                     = var.storage_account_name
  resource_group_name      = module.platform_resource_group.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind
  share_name               = var.share_name
  aad_group_fslogix_id     = var.aad_group_fslogix_id
  tags                     = var.tags

}

