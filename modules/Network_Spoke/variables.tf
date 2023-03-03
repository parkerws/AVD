variable "tags" {
  type        = map(string)
  description = "Required tags with values that will be attached to deployed resources. Passed over as a map type."
}

variable "name_root" {
  type        = string
  description = "String that is used for the middle part of the name. Should be created via tags and a local block."
}

variable "subnet_list" {
  description = "A list of subnets to be attached to the VNET. The variable should include a list of maps with the subnetName and prefix included."
  type        = list(any)
}

variable "resource_group_name" {
  type        = string
  description = "The desired resource group name to be used for the deployed networking components."
}

variable "location" {
  type        = string
  description = "The desired Azure region to be deployed to."
}

variable "route_table_name" {
  type        = string
  description = "The name of the Route table."
  default     = "default"
}

variable "use_remote_gateways" {
  type        = bool
  description = "Will the spoke use the virtual network gateway? Set to yes, unless there is not a vng."
  default     = true
}

variable "vnet_name" {
  description = "The name of the VNET."
  default     = "vnet"
}

variable "vnet_address_space" {
  description = "The address space allocated to the VNET."
}

variable "dns_servers" {
  description = "List the DNS servers that can be applied to the VNET. (Optional)"
  type        = list(string)
}

variable "hub_routes" {
  description = "List the routes that can be applied to the VNET. (Optional)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "default_nsg_name" {
  description = "The name of the default Network Security Group."
  default     = "anyany"
}

variable "hub_vnet_name" {
  type        = string
  description = "Name of the hub VNET, used for naming peering."
}

variable "hub_vnet_rg" {
  type        = string
  description = "Name of the hub VNET resource group."
}

variable "hub_vnet_id" {
  type        = string
  description = "The hub VNET ID."
}

variable "firewall_ip" {
  type        = string
  description = "IP that traffic should be forwarded to to reach firewalls."
}

variable "disable_bgp_propagation" {
  type        = bool
  description = "Enables BGP from hub if set to false, if set to true will disable BGP to the spoke."
}

variable "enforce_private_link_endpoint_network_policies" {
  type        = bool
  description = "Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy."
  default     = true
}