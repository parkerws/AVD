location                         = "eastus2"
rg_name                          = "rg-avd-envtest1"
workspace_name                   = "ws-avd-envtest1"
app_group_name                   = "ag-avd-envtest1"
host_pool_name                   = "hp-avd-envtest1"
host_pool_type                   = "Pooled"
load_balancer_type               = "DepthFirst"
vm_size                          = "Standard_D2S_v3"
image_publisher                  = "MicrosoftWindowsDesktop"
image_offer                      = "Windows-10"
image_sku                        = "win10-21h2-avd"
image_version                    = "latest"
admin_username                   = "azureadmin"
admin_password                   = "Pa55w.rd1234!"
avd_subnet_id                    = "/subscriptions/88f5201f-8646-4fc6-ad6c-84a511e43b16/resourceGroups/rg-avd-vnet/providers/Microsoft.Network/virtualNetworks/vnet-avd-vnet-avd-parkdevlab-10.10.0.0_24/subnets/sub-avd--10.10.0.0_25"
vm_name                          = "vmavdtest"
vm_count                         = 3
domain                           = "parkdevlab.com"
domainpassword                   = "Pa55w.rd1234!"
domainuser                       = "labadmin"
ou_path                          = ""
custom_image_enabled             = false
custom_image_name                = ""
custom_image_resource_group_name = ""

tags = {
  env = "envtest1"
}