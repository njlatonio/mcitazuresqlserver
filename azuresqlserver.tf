resource "azurerm_resource_group" "databaserg" {
  name     = var.name
  location = var.location
}

resource "azurerm_mssql_server" "azuresqlserver" {
  name                         = var.mysqlname
  resource_group_name          = azurerm_resource_group.databaserg.name
  location                     = azurerm_resource_group.databaserg.location
  version                      = var.version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
