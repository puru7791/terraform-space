variable "prefix" {
  type    = string
}

variable "tags" {
  type = map(string)
}


variable "location" {
  type = string

}


## Variables for module Vnet

variable "address_spaces" {
  type    = list(string)

}

########################################
# subnet variables


variable "subnet_address_prefixes" {
  type    = list(string)

}


variable "vm_size" {
  type    = string

}

variable "disk_size_gb" {

}

variable "admin_profile" {
  description = "Mapping the admin user profiles"
  type        = map(string)
}
