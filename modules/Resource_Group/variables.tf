
/* -------------------- RESOURCE VARIABLE DEFINITIONS -------------------- */

variable "resource_group_name" {
  description = "Denotes the name of the resource group."
  type        = string
}

variable "location" {
  description = "Denotes the location of the resource group. e.g. centralus, eastus2"
  type        = string
}

variable "lock" {
  #type        = bool
  description = "Applies a lock to the RG if set to true."
  default     = false
}

variable "tags" {
  type        = map(any)
  description = "The collection of tags to add to the resource group."
}