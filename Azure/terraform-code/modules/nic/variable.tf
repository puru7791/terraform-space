variable "rg_name" {
  type = string

}
variable "location" {
  type = string

}
variable "tags" {
  type = map(string)
}

# Variable for Network Security Group

variable "nsg_name" {
  type = string

}

# Network interface 

variable "nic_name" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "subnet_id" {

}

# Public IP 

variable "pip_name" {
  type = string
}

