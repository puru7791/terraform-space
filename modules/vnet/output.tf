output "network_interface_id" {
  description = "The ID of the NIC"
  value       = azurerm_network_interface.mynic.id
}
output "vnet_name" {
  value = azurerm_virtual_network.myvnet.name

}

