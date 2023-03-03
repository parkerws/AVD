variable "location" {
  description = "Location to Create all resources"
}

variable "rg-name" {
  description = "The name of the resource group to be created"
}

variable "wkspace-name" {
  description = "The name of the WVD workspace to be created"
  default     = "avd-wkspace"
}

variable "hppooled-name" {
  description = "The name of the WVD pooled hostpool to be created"
  default     = "avd-hp"
}

variable "appgrp-name" {
  description = "The name of the WVD app group to be created"
  default     = "AVD-DAG"
}


variable "vm_size" {
  description = "Specifies the size of the virtual machine."
}

variable "image_publisher" {
  description = "Image Publisher"
}

variable "image_offer" {
  description = "Image Offer"
}

variable "image_sku" {
  description = "Image SKU"
}

variable "image_version" {
  description = "Image Version"
  default     = "latest"
}

variable "admin_username" {
  description = "Local Admin Username"
  default     = ""
}

variable "admin_password" {
  description = "Admin Password"
}
variable "subscription_id" {
  type        = string
  description = "Enter the Subscription ID"
}

variable "avd_vnet_rg" {
  type        = string
  description = "Enter the RG name of your AVD Vnet"
}

variable "avd_vnet" {
  type        = string
  description = "Enter the Vnet for the AVD deployment:"
}

variable "avd_subnet" {
  type        = string
  description = "Enter the subnet for the AVD deployment:"
}

variable "vm_name" {
  description = "Session Host/VM Name:"
}

variable "vm_count" {
  description = "Number of Session Host VMs to create:"
}

variable "vm_shutdown_time" {
  type        = string
  description = "sets the time for scheduled VM shutdown. Ex '1100': "
}

variable "domain" {
  description = "Domain to join"
}

variable "domainuser" {
  description = "Domain Join User Name"
}

variable "domainpassword" {
  description = "Domain User Password"
}

variable "regtoken" {
  description = "Host Pool Registration Token"
  default     = "Host Pool Registration Token"
}

variable "hostpoolname" {
  description = "Host Pool Name to Register Session Hosts"
  default     = "AVD-HP"
}

variable "artifactslocation" {
  description = "Location of WVD Artifacts"
  default     = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_09-08-2022.zip"
}

variable "installTeams" {
  type        = bool
  description = "Installs Teams. Enter true or false boolean value"
  default     = false
}


variable "tenantID" {
  type = string
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


variable "custom_image_enabled" {
  type        = bool
  description = "Enable if using a custom image for VM creation"
}
variable "custom_image_name" {
  type        = string
  description = "Name of the custom image in Azure"
}

variable "custom_image_resource_group_name" {
  type        = string
  description = "Name of resource group target image resides in"
}
