# Configure the Azure provider
# En mi caso: Terraform v1.2.5

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.10.0"
    }
  }

  required_version = ">= 1.1.0"
}

# Podría utilizar las features para limitar el uso.

provider "azurerm" {
  features {}
}