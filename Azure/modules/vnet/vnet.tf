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

# Network Security Group

resource "azurerm_network_security_group" "my-nsg" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

# Network Interface

resource "azurerm_network_interface" "mynic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
  location            = var.location
  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

# Nsg assiciation to NIC

resource "azurerm_network_interface_security_group_association" "nsg-nic-assiciation" {
  network_security_group_id = azurerm_network_security_group.my-nsg.id
  network_interface_id      = azurerm_network_interface.mynic.id

}