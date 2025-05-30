
variable "rg_name" {
  type = string

}
variable "location" {
  type = string

}

# Vnet variables
variable "vnet_name" {
  type = string

}

variable "address_spaces" {
  type = list(string)

}


# subnet variables

variable "subnet_name" {
  type = string

}
variable "subnet_address_prefixes" {
  type = list(string)
}



variable "tags" {
  type = map(string)
}