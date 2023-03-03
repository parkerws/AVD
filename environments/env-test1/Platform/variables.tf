

/* -------------------- RESOURCE VARIABLE DEFINITIONS -------------------- */

variable "location" {
  description = "The Region the resource is located in."
  type        = string
}

variable "rg_name" {
  description = "The Resource Group the Key Vault is placed in."
  type        = string
}

variable "key_vault_sku_name" {
  description = "The sku for the Key Vault, options are Standard or Premium."
  type        = string
}

variable "tenant_id" {
  description = "The ID for the tenant. (equal to client_config.tenant_id)"
  type        = string
}

variable "tags" {
  description = "The collection of tags to add to the resource."
  type        = map(string)
}

variable "kv_aad_object_id" {
  description = "The AAD Object_ID for a user or principal to be used in the access control list of the Key Vault."
  type        = string
}

variable "key_vault_name" {
  description = "The name for the Key Vault."
  type        = string
}

/* #uncomment the variables below if you wish to restrict access to the Key Vault to specific subnets or CIDR ranges.
variable "default_action" {
  description = "The default access option for resources that are not specified in the network ruleset for the Key Vault, options are Allow or Deny."
  type = string
}

variable "virtual_network_subnet_ids" {
  description = "The IDs for the subnets that should be able to access the Key Vault when network rules are enabled."
  type = list(string)
}

variable "ip_rules" {
  description = "A list of IPs or CIDR blocks that should be able to access the Key Vault."
  type = list(string)
}
*/

variable "storage_account_tier" {
  type        = string
  description = "The tier of storage for this Storage Account. Options are Standard or Premium."
}

variable "storage_account_replication_type" {
  type        = string
  description = "This defines the data replication type for the Storage Account. Options are LRS, ZRS, GRS, GZRS, RAGRS, and RAGZRS."
}

variable "storage_account_kind" {
  type        = string
  description = "The category for the Storage Account, StorageV2 is the default. Other options include FileStorage or BlobStorage."
}

variable "enable_https_traffic_only" {
  type        = string
  description = "A setting to require that communication use SSL (HTTPS) when accessing the Storage Account. The default is true."
  default     = true
}

variable "storage_account_name" {
  type        = string
  description = "The name for the Storage Account. 24 character max, all lowercase letters and numbers, no spaces, dashes, or special characters. The name must also be globally unique across all Microsoft customers."
}

variable "share_name" {
  type        = string
  description = "Name of the file share to create"
  default     = "fslogix"
}

variable "aad_group_fslogix_id" {
  type        = string
  description = "ID of Azure AD Group to assign SMB Data Contributor role to at the storage scope"
}
/*
variable "default_action" {
  type = string
  description = "If network rules are used, this will be the default action used for connections not matching existing rules. Allow or Deny are the options."
}

variable "virtual_network_subnet_ids" {
  type = list(string)
  description = "A list of subnet IDs that are permitted to access the Storage Account."
}

variable "ip_rules" {
  type = list(string)
  description = "A list of IPs or CIDR blocks that are permitted to access the Storage Account."
}
*/
variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "A second layer of optional encryption, the default is true."
  default     = true
}
