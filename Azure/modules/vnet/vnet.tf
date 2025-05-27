resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  address_space       = var.address_spaces
  location            = var.location
  tags                = var.tags
}

# subnet

resource "azurerm_subnet" "mysubnet" {
  name                 = var.subnet_name
  address_prefixes     = var.subnet_address_prefixes
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.myvnet.name

}



