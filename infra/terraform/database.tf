locals {
  location = "West US 3"
}

resource "azurerm_user_assigned_identity" "allmymedia_db_admin" {
  name                = "db-admin"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.allmymedia_rg.name
}

resource "azurerm_mssql_server" "allmymedia_db_server" {
  name                = "allmymedia-mssql-server"
  location            = "West US 3"
  resource_group_name = data.azurerm_resource_group.allmymedia_rg.name
  version             = "12.0"

  azuread_administrator {
    login_username              = azurerm_user_assigned_identity.allmymedia_db_admin.name
    object_id                   = azurerm_user_assigned_identity.allmymedia_db_admin.principal_id
    azuread_authentication_only = true
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.allmymedia_db_admin.id]
  }

  primary_user_assigned_identity_id = azurerm_user_assigned_identity.allmymedia_db_admin.id
}

resource "azurerm_mssql_database" "allmymedia_db" {
  name      = "allmymedia-mssql-db"
  server_id = azurerm_mssql_server.allmymedia_db_server.id
}
