
output "vnet_id" {
  value = azurerm_virtual_network.myvnet.id

}
output "subenet_id" {
  value = azurerm_subnet.mysubnet.id
}

