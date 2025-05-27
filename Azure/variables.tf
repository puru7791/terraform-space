variable "prefix" {
  type    = string
}

variable "tags" {
  type = map(string)
}

###############################
# variables for resource group
# variable "rgname" {
#   default = "${var.prefix}-rg"

# }


variable "location" {
  type = string

}


## Variables for module Vnet
# variable "vnet_name" {
#   default = "${var.prefix}-vnet"

# }

variable "address_spaces" {
  type    = list(string)

}

########################################
# subnet variables

# variable "subnet_name" {
#   default = "${var.prefix}-subnet"
# }

variable "subnet_address_prefixes" {
  type    = list(string)

}


variable "vm_size" {
  type    = string

}

# variable "diskName" {
#   description = "Name of the new managed disk."
#   default     = "${var.prefix}ManagedDisk01"
# }

variable "disk_size_gb" {

}

variable "admin_profile" {
  description = "Mapping the admin user profiles"
  type        = map(string)
  default = {
    "admin_username" = ""
    "admin_password" = ""
  }

}

#############################
# For testing
variable "rg_name" {
  type = string
}
variable "vnet_name" {
  type = string
  
}
variable "subnet_name" {
  type = string
}
###########################
