resource "azurerm_virtual_machine" "myvm" {
  resource_group_name = var.rg_name
  vm_size             = var.vmSize #"Standard_B1s"
  location            = var.location
  name                = var.vmName

  storage_image_reference {
    publisher = var.image_reference["publisher"]
    offer     = var.image_reference["offer"]
    sku       = var.image_reference["sku"]
    version   = var.image_reference["version"]
  }

  storage_os_disk {
    name              = "osdisk-${var.vmName}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.disk_type

  }

  storage_data_disk {
    name            = azurerm_managed_disk.mydisk.name
    managed_disk_id = azurerm_managed_disk.mydisk.id
    disk_size_gb    = azurerm_managed_disk.mydisk.disk_size_gb
    create_option   = "Attach"
    lun             = 1


  }
  network_interface_ids         = var.network_interface_ids
  delete_os_disk_on_termination = true


  os_profile {
    computer_name  = var.vm_os_profile["computer_name"]
    admin_username = var.vm_os_profile["admin_username"]
    admin_password = var.vm_os_profile["admin_password"]
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags       = var.tags
  depends_on = [azurerm_managed_disk.mydisk]
}

resource "azurerm_managed_disk" "mydisk" {
  name                 = var.diskName
  resource_group_name  = var.rg_name
  location             = var.location
  create_option        = "Empty"
  storage_account_type = var.disk_type #"Standard_LRS"
  disk_size_gb         = var.disk_size_gb

}