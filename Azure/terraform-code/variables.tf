variable "prefix" {
  type    = string
}

variable "tags" {
  type = map(string)
}


variable "location" {
  type = string

}

/*
######################################## 
#Variables for module Vnet
########################################
variable "address_spaces" {
  type    = list(string)

}

# subnet variables

variable "subnet_address_prefixes" {
  type    = list(string)

}

########################################
# Variables for module VM
########################################
variable "vm_size" {
  type    = string

}

variable "disk_size_gb" {

}

variable "admin_password" {
  type = string
  sensitive = true
  
}
*/
#######################################
# AKS Module Variable Definitions
#######################################
# variable "clusterName" {
#   type = string
# }
variable "dns_prefix" {
  
}
variable "clientId" {
  
}
variable "clientSecret" {
  
}
variable "tenant_id" {
  
}
variable "defaultPoolVm_size" {
  
}