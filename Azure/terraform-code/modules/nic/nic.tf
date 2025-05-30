
# Network Interface

resource "azurerm_network_interface" "mynic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
  location            = var.location
  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.mypip.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

# Public Ip 

resource "azurerm_public_ip" "mypip" {
  name                    = var.pip_name
  resource_group_name     = var.rg_name
  location                = var.location
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  tags                    = var.tags
}

# Network Security Group

resource "azurerm_network_security_group" "my-nsg" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = var.tags
}

# Nsg assiciation to NIC

resource "azurerm_network_interface_security_group_association" "nsg-nic-assiciation" {
  network_security_group_id = azurerm_network_security_group.my-nsg.id
  network_interface_id      = azurerm_network_interface.mynic.id

}


#####Output Variables######
output "network_interface_id" {
  description = "The ID of the NIC"
  value       = azurerm_network_interface.mynic.id
}
