variable "name" {
  type        = string
  description = "The name for the Private Endpoint."
}

variable "location" {
  type        = string
  description = "The Region the resource is located in."
}

variable "resource_group_name" {
  type        = string
  description = "The Resource Group the Private Endpoint is placed in."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to draw the Private IP from."
}

variable "private_connection_resource_id" {
  type        = string
  description = "The ID of the resource that will use this Private Endpoint."
}

variable "subresource_names" {
  type        = list(string)
  description = "A list of sub-resources the Endpoint is permitted to connect to. The list of options is long but some examples are sqlServer, blob, or dfs."
}

variable "is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require manual approval from the owner of the resource the endpoint will be used with?"
}

variable "tags" {
  type        = map(string)
  description = "The collection of tags to add to the resource."
}

