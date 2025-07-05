data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  include_preview = false
}

resource "azurerm_kubernetes_cluster" "my-aks" {
  name                = var.clusterName
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.rg_name}-nodepool"
  default_node_pool {
    name                 = "defaultpool"
    vm_size              = var.defaultPoolVm_size #"Standard_D2_v2"
    auto_scaling_enabled = true
    zones                = [1, 2, 3]
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"


    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
    }

  }
  service_principal {
    client_id = var.clientId
    client_secret = var.clientSecret
  }
  azure_policy_enabled              = true
  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id = var.tenant_id
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
  tags = {
    Environment = "Dev"
  }
}


#### User node pool definintion

resource "azurerm_kubernetes_cluster_node_pool" "linux-pool" {
  name                  = "linux102"
  auto_scaling_enabled  = true
  zones                 = [1, 2, 3]
  min_count             = 1
  max_count             = 2
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = "Standard_D2_v2"
  os_disk_size_gb       = 30
  mode                  = "User"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.my-aks.id
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  priority              = "Regular" # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints

  node_labels = {
    "nodepool-type" = "user"
    "environment"   = "Dev"
    "os-type"       = "linux"
  }
  tags = {
    "nodepool-type" = "user"
    "environment"   = "Dev"
    "os-type"       = "linux"
  }
}