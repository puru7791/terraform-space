variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "clusterName" {
  type = string

}

variable "dns_prefix" {
  type = string
}
variable "defaultPoolVm_size" {

}
variable "clientSecret" {
  type = string
  sensitive = true
}
variable "clientId" {
  type = string
  sensitive = true
}
variable "tenant_id" {
  type = string
  sensitive = true
}