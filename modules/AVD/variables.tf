variable "location" {
  description = "Location to Create all resources"
}

variable "rg_name" {
  description = "The name of the resource group to be created"
}

variable "workspace_name" {
  description = "The name of the WVD workspace to be created"
  default     = "avd-wkspace"
}

variable "hp_name" {
  description = "The name of the WVD pooled hostpool to be created"
  default     = "avd-hp"
}

variable "app_group_name" {
  description = "The name of the WVD app group to be created"
  default     = "AVD-DAG"
}

variable "host_pool_name" {
  description = "Host Pool Name to Register Session Hosts"
  default     = "AVD-HP"
}

variable "host_pool_type" {
  type        = string
  description = "Select between Pooled and Personal"

}

variable "load_balancer_type" {
  type        = string
  description = "Select between DepthFirst and BreadthFirst, or Persistent for Personal Host Pools"
  default     = "Persistent"
}

variable "tags" {
  type        = map(string)
  description = "The collection of tags to add to the resource."
}