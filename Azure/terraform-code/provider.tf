terraform {
  required_providers {
    azurerm   = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"

    }
    null      = {
      source  = "hashicorp/null"
      version = "~> 3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "tfgithubactionstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}  # <-- REQUIRED
}