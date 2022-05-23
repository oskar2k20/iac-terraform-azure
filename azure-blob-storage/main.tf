resource "azurerm_resource_group" "example" {
  name     = var.name_example_resources
  location = var.location
}


resource "azurerm_storage_account" "example" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}


resource "azurerm_storage_container" "example" {
  name                  = var.name_storage_container
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.access_container_type
}


resource "azurerm_storage_blob" "example" {
  name                   = var.name_storage_blob
  url                    = var.url_storage_blob
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.type_storage_blob
  source                 = var.source_storage_blob
}



