locals {
  kv_name = var.kv_name
  kv_rg   = var.kv_rg
}

data "azurerm_key_vault" "sqlhstkv" {
  count = var.keyvault_enable ? 1 : 0

  name                = local.kv_name
  resource_group_name = local.kv_rg
}

data "azurerm_key_vault_secret" "sqlhstsvc" {
  count = var.keyvault_enable ? 1 : 0

  name         = "sqlhstsvc"
  key_vault_id = data.azurerm_key_vault.sqlhstkv[count.index].id
}

data "azurerm_key_vault_secret" "storageaccountname" {
  count = var.keyvault_enable ? 1 : 0

  name         = "storageaccountname"
  key_vault_id = data.azurerm_key_vault.sqlhstkv[count.index].id
}

data "azurerm_storage_account" "storageaccountinfo" {
  count = var.keyvault_enable ? 1 : 0

  name                = data.azurerm_key_vault_secret.storageaccountname[count.index].value
  resource_group_name = var.storageaccountinfo_resource_group_name
}

data "azurerm_virtual_network" "Vnet" {
  name                = var.private_endpoint.vnet_name
  resource_group_name = var.private_endpoint.vnet_rg_name
}


data "azurerm_subnet" "Subnet" {
  name                 = var.private_endpoint.subnet_name
  virtual_network_name = data.azurerm_virtual_network.Vnet.name
  resource_group_name  = var.private_endpoint.vnet_rg_name
}
