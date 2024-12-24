terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = "3.43.0"
    }
  }

   cloud { 
    
    organization = "Ira-369" 

    workspaces { 
      name = "TerraformCI" 
    } 
  } 
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}


variable "storage_account_replication_type" {
  type = string
  default = "LRS"
}
variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "location" {
  type = string
  default = "westus"
}

variable "resource_group_name" {
    type = string
    default = "811-8a348f30-provide-continuous-delivery-with-gith"
  
}

resource "random_string" "uniquestring" {
  length           = 20
  special          = false
  upper            = false
}

# resource "azurerm_resource_group" "rg" {
#   name     = "811-83d90123-provide-continuous-delivery-with-gith"
#   location = "westus"
# }

#IAC test
resource "azurerm_storage_account" "storageaccount" {
  name                     = "stg${random_string.uniquestring.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}
