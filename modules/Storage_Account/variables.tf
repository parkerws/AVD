variable "account_tier" {
  type        = string
  description = "The tier of storage for this Storage Account. Options are Standard or Premium."
}

variable "account_replication_type" {
  type        = string
  description = "This defines the data replication type for the Storage Account. Options are LRS, ZRS, GRS, GZRS, RAGRS, and RAGZRS."
}

variable "account_kind" {
  type        = string
  description = "The category for the Storage Account, StorageV2 is the default. Other options include FileStorage or BlobStorage."
}

variable "enable_https_traffic_only" {
  type        = string
  description = "A setting to require that communication use SSL (HTTPS) when accessing the Storage Account. The default is true."
  default     = true
}

variable "name" {
  type        = string
  description = "The name for the Storage Account. 24 character max, all lowercase letters and numbers, no spaces, dashes, or special characters. The name must also be globally unique across all Microsoft customers."
}

variable "tags" {
  type        = map(any)
  description = "The collection of tags to add to the resource."
}

variable "resource_group_name" {
  type        = string
  description = "The Resource Group the Storage Account is placed in."
}

variable "location" {
  type        = string
  description = "The Region the resource is located in."
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

variable "file_share_quota" {
  type = number
  description = "Quota in GB for the file share. Must be greater than 0 and less that 5120 GB (5 TB)"
}