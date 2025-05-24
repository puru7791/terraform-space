variable "prefix" {
  type    = string
  default = "puru"
}

variable "tags" {
  type = map(string)
  default = {
    "Env"        = "Develop"
    "Created_By" = "Dev Team"
    "Team"       = "Infra-Team"
  }
}

###############################
# variables for resource group
# variable "rgname" {
#   default = "${var.prefix}-rg"

# }


variable "location" {
  type = string
  default = "East US"

}


## Variables for module Vnet
# variable "vnet_name" {
#   default = "${var.prefix}-vnet"

# }

variable "address_spaces" {
  type    = list(string)
  default = ["10.0.0.0/16"]

}

########################################
# subnet variables

# variable "subnet_name" {
#   default = "${var.prefix}-subnet"
# }

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]

}

# variable "nsgName" {
#   description = "A Network Security Group Name"
#   default     = "${var.prefix}-nsg"
# }

####################################
# Variables for Nic 

# variable "nic_name" {
#   type    = string
#   default = "${var.prefix}-nic"

# }
# variable "ip_config_name" {
#   default = "${var.prefix}-config"

# }

#######################################################
# Variables for Virtual machine module

# variable "vm_name" {
#   default = "${var.prefix}-vm01"

# }

variable "vm_size" {
  type    = string
  default = "Standard_B1s"

}

# variable "diskName" {
#   description = "Name of the new managed disk."
#   default     = "${var.prefix}ManagedDisk01"
# }

variable "disk_size_gb" {
  default = "20"

}

variable "admin_profile" {
  description = "Mapping the admin user profiles"
  type        = map(string)
  default = {
    "admin_username" = ""
    "admin_password" = ""
  }

}



## Backend variables

variable "storage_account_name" {
  type = string
  default = "tfstateFiles"
}
