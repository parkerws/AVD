variable "location" {
  type        = string
  description = "Location to Create all resources"
}

variable "avd_rg" {
  type        = string
  description = "The name of the resource group to be created"
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the virtual machine."
}

variable "image_publisher" {
  type        = string
  description = "Image Publisher"
}

variable "image_offer" {
  type        = string
  description = "Image Offer"
}

variable "image_sku" {
  type        = string
  description = "Image SKU"
}

variable "image_version" {
  type        = string
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

variable "avd_subnet_id" {
  type        = string
  description = "Enter the subnet for the AVD deployment:"
}

variable "vm_name" {
  type        = string
  description = "Session Host/VM Name:"
}

variable "vm_count" {
  type        = number
  description = "Number of Session Host VMs to create:"
}


variable "domain" {
  type        = string
  description = "Domain to join"
}

variable "domainuser" {
  type        = string
  description = "Domain Join User Name"
}

variable "domainpassword" {
  type        = string
  description = "Domain User Password"
}

variable "ou_path" {
  type        = string
  description = "OU path to place joined session host in"
}

variable "regtoken" {
  type        = string
  description = "Host Pool Registration Token"
  default     = "Host Pool Registration Token"
}

variable "hostpoolname" {
  type        = string
  description = "Host Pool Name to Register Session Hosts"
  default     = "AVD-HP"
}

variable "artifactslocation" {
  type        = string
  description = "Location of WVD Artifacts"
  default     = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_09-08-2022.zip"
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

variable "tags" {
  type        = map(string)
  description = "The collection of tags to add to the resource."
}