terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name   = "pardeeptestrg"              # RG where storage account exists
    storage_account_name  = "pardeeptestsg"       # Storage account name
    container_name        = "pardeepcontainertest"                 # Blob container for state
    key                   = "githubaction.terraform.tfstate"       # Name of the state file
  }
}

provider "azurerm" {
  features {}
  subscription_id = "74282b2c-f351-49d2-8fc1-345ec077bafb"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resourcesgit"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountnamegit"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}