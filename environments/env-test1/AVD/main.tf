locals {
  workspace_pe_name = "pe-${var.workspace_name}"
  hostpool_pe_name = "pe-${var.host_pool_name}"
  global_workspace_pe_name = "pe-global-${var.workspace_name}"
}

module "avd_resource_group" {
  source = "../../../modules/Resource_Group"

  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

module "avd_resources" {
  source = "../../../modules/AVD"

  location           = var.location
  rg_name            = module.avd_resource_group.name
  workspace_name     = var.workspace_name
  host_pool_name     = var.host_pool_name
  app_group_name     = var.app_group_name
  host_pool_type     = var.host_pool_type
  load_balancer_type = var.load_balancer_type
  tags               = var.tags

}

module "session_hosts" {
  source = "../../../modules/AVD_Session_Host"

  location                         = var.location
  avd_rg                           = module.avd_resource_group.name
  vm_count                         = var.vm_count
  vm_name                          = var.vm_name
  vm_size                          = var.vm_size
  image_publisher                  = var.image_publisher
  image_offer                      = var.image_offer
  image_sku                        = var.image_sku
  image_version                    = var.image_version
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  avd_subnet_id                    = var.avd_subnet_id
  custom_image_enabled             = var.custom_image_enabled
  custom_image_name                = var.custom_image_name
  custom_image_resource_group_name = var.custom_image_resource_group_name
  domain                           = var.domain
  ou_path                          = var.ou_path
  domainuser                       = var.domainuser
  domainpassword                   = var.domainpassword
  regtoken                         = module.avd_resources.registration_token
  tags                             = var.tags
  depends_on = [
    module.avd_resources
  ]
}

module "app_security_group" {
  source = "../../../modules/Application_Security_Group"
  asg_name = var.asg_name
  location = var.location
  nic_list = module.session_hosts.session_host_nic_id
  rg_name = module.avd_resource_group.name
}

module "avd_workspace_private_endpoint" {
  source = "../../../modules/Private_Endpoint"
  name = local.workspace_pe_name
  location = var.location
  resource_group_name = module.avd_resource_group.name
  subnet_id = var.avd_pe_subnet_id
  tags = var.tags
  private_connection_resource_id = module.avd_resources.workspace_id
  is_manual_connection = false
  subresource_names = ["feed"]
}

module "avd_hostpool_private_endpoint" {
  source = "../../../modules/Private_Endpoint"
  name = local.hostpool_pe_name
  location = var.location
  resource_group_name = module.avd_resource_group.name
  subnet_id = var.avd_pe_subnet_id
  tags = var.tags
  private_connection_resource_id = module.avd_resources.hostpool_id
  is_manual_connection = false
  subresource_names = ["connection"]
}

module "avd_workspace_global_private_endpoint" {
  source = "../../../modules/Private_Endpoint"
  name = local.global_workspace_pe_name
  location = var.location
  resource_group_name = module.avd_resource_group.name
  subnet_id = var.avd_pe_subnet_id
  tags = var.tags
  private_connection_resource_id = module.avd_resources.workspace_id
  is_manual_connection = false
  subresource_names = ["global"]
}