locals {
  rg_name = "${var.prefix}-rg"
  vnet_name = "${var.prefix}-vnet"
  subnet_name = "${var.prefix}-subnet01"
  nsgName  = "${var.prefix}-nsg"
  nic_name  = "${var.prefix}-nic"
  ip_config_name  = "${var.prefix}-IpConfig"
  vm_name  = "${var.prefix}-vm01"
  diskName = "${var.prefix}ManagedDisk01"
}