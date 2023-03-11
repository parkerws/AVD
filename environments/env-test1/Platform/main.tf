locals {
  storage_account_pe_name = "${var.storage_account_name}-pe"
}
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
  file_share_quota = var.file_share_quota
  tags                     = var.tags

}

module "storage_account_endpoint" {
  source                         = "../../../modules/Private_Endpoint"
  name                           = local.storage_account_pe_name
  location                       = var.location
  resource_group_name            = module.platform_resource_group.name
  subnet_id                      = var.storage_pe_subnet_id
  tags                           = var.tags
  private_connection_resource_id = module.storage_account.id
  is_manual_connection           = false
  subresource_names              = ["file"]
}