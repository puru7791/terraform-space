# Variable for RG
variable "rg_name" {

}

variable "location" {

}

# Variables for Virtual Machine

variable "vmName" {
  type = string
}

variable "vmSize" {

}

variable "network_interface_ids" {
  type = list(string)

}
variable "disk_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  default     = "Standard_LRS"
}

variable "admin_profile" {
  description = "Map of Admin user profiles"
  type        = map(string)

}

# Disk

variable "diskName" {
  type = string

}

variable "image_reference" {
  description = "Map of image reference details"
  type        = map(string)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

variable "disk_size_gb" {
  type = string

}

variable "tags" {
  type = map(string)
}
