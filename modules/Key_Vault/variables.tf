

/* -------------------- RESOURCE VARIABLE DEFINITIONS -------------------- */

variable "location" {
  description = "The Region the resource is located in."
  type        = string
}

variable "resource_group_name" {
  description = "The Resource Group the Key Vault is placed in."
  type        = string
}

variable "sku_name" {
  description = "The sku for the Key Vault, options are Standard or Premium."
  type        = string
}

variable "tenant" {
  description = "The ID for the tenant. (equal to client_config.tenant_id)"
  type        = string
}

variable "tags" {
  description = "The collection of tags to add to the resource."
  type        = map(string)
}

variable "object_id" {
  description = "The AAD Object_ID for a user or principal to be used in the access control list of the Key Vault."
  type        = string
}

variable "name" {
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
