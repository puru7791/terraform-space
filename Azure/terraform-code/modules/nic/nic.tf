
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
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# NSG Rules
/*
resource "azurerm_network_security_rule" "test" {
  count                       = "${length(var.inbound_port_ranges)}"
  name                        = "sg-rule-${count.index}"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.my-nsg.name
  direction                   = "Inbound"
  access                      = "Allow"
  priority                    = "(100 * (${count.index} + 1))"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "${element(var.inbound_port_ranges, count.index)}"
  protocol                    = "TCP"
}
*/
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
