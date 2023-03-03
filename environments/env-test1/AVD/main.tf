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

