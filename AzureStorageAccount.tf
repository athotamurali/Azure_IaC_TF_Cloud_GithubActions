resource "azurerm_resource_group" "demo" {
  name     = "example-resources"
  location = "West Europe"
}

# Generate a random suffix
resource "random_id" "storage_suffix" {
  byte_length = 4
}

resource "azurerm_storage_account" "StorageAccountDemo" {
  # The storage account name must be between 3 and 24 characters, using only lowercase letters and numbers.
  name                     = "satestant${random_id.storage_suffix.hex}"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  # Other settings...
}
