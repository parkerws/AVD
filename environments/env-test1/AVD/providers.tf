terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}