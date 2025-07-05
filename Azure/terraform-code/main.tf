# Module Azure Resource Group
module "rg" {
  source   = "./modules/resource_group"
  location = var.location
  rg_name  = local.rg_name
  tags     = var.tags
}

#Module Azure Virtual Network
/*
module "vnet" {
  source                  = "./modules/vnet"
  vnet_name               = local.vnet_name
  address_spaces          = var.address_spaces
  subnet_name             = local.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  rg_name                 = module.rg.rg_name
  location                = module.rg.location
  tags                    = var.tags
  
}

# Nic module definition

module "nic" {
  source                  = "./modules/nic"
  nic_name                = local.nic_name
  ip_config_name          = local.ip_config_name
  nsg_name                = local.nsgName
  tags                    = var.tags
  rg_name                 = module.rg.rg_name
  location                = module.rg.location
  subnet_id               = module.vnet.subnet_id
  pip_name                = local.pipName
}

# Virtual Machine module definition

module "vm" {
  source                = "./modules/vm"
  vmName                = local.vm_name
  rg_name               = module.rg.rg_name
  location              = module.rg.location
  vmSize                = var.vm_size
  network_interface_ids = [module.nic.network_interface_id]
  tags                  = var.tags
  diskName              = local.diskName
  disk_size_gb          = var.disk_size_gb
  vm_os_profile         = {
    computer_name       = local.vm_name
    admin_username      = "azureuser"
    admin_password      = var.admin_password
  }
}
*/
module "aks" {
  source = "./modules/aks"
  clusterName = local.clusterName
  dns_prefix = var.dns_prefix
  rg_name = module.rg.rg_name
  location = module.rg.location
  clientId = var.clientId
  clientSecret = var.clientSecret
  defaultPoolVm_size = var.defaultPoolVm_size
}