resource "azurerm_resource_group" "myrg" {
  name     = var.rg_name
  location = var.location
  tags = var.tags
}

output "rg_name" {
  value = azurerm_resource_group.myrg.name
}
output "location" {
  value = azurerm_resource_group.myrg.location
}