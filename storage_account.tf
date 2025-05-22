resource "azurerm_storage_account" "this" {
  count = var.kv_enable ? 0 : 1

  name                     = "${replace(var.name, "-", "")}mssql"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = var.account_replication_type
  # enable_blob_encryption  = "True"
  # enable_file_encryption  = "True"
  access_tier                = "Hot"
  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"
}

resource "azurerm_storage_container" "this" {
  count = var.kv_enable ? 0 : 1

  name                  = "${replace(var.name, "-", "")}mssql"
  storage_account_id    = azurerm_storage_account.this[count.index].id
  container_access_type = "private"
}