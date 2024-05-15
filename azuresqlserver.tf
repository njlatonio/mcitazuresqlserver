
resource "azurerm_resource_group" "databaserg" {
  name     = var.name
  location = var.location
}

resource "azurerm_mssql_server" "azuresqlserver" {
  name                         = var.mysqlname
  resource_group_name          = azurerm_resource_group.databaserg.name
  location                     = azurerm_resource_group.databaserg.location
  version                      = var.resourceversion
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  azuread_administrator {
    login_username = var.login_username
    object_id      = var.object_id
  }

  tags = {
    environment = var.environment
  }
}
