locals {
  kv_name = var.kv_name
  kv_rg   = var.kv_rg
}

data "azurerm_key_vault" "sqlhstkv" {
  name                = local.kv_name
  resource_group_name = local.kv_rg
}

data "azurerm_key_vault_secret" "sqlhstsvc" {
  name         = "sqlhstsvc"
  key_vault_id = data.azurerm_key_vault.sqlhstkv.id
}

data "azurerm_key_vault_secret" "storageaccountname" {
  name         = "storageaccountname"
  key_vault_id = data.azurerm_key_vault.sqlhstkv.id
}

data "azurerm_storage_account" "storageaccountinfo" {
  name                = data.azurerm_key_vault_secret.storageaccountname.value
  resource_group_name = var.storageaccountinfo_resource_group_name
}
