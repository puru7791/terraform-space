prefix = "puru"
tags = {
  "Env"        = "Develop"
  "Created_By" = "Dev Team"
  "Team"       = "Infra-Team"
}
location = "East US"
address_spaces = [ "10.0.0.0/16" ]  #Vnet address space
subnet_address_prefixes = [ "10.0.1.0/24" ]
# VM variables
vm_size = "Standard_B1s"
disk_size_gb = "20"
# admin_profile = {
#   "admin_username" = ""
#   "admin_password" = ""
# }