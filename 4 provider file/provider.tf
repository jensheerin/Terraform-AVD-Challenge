# The ~> operator is a convenient shorthand for allowing only patch releases within a specific minor release

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }


    provider "azurerm" {
      features {}
    }
  }
}
