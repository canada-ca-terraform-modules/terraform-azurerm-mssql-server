resource "azurerm_mssql_server" "mssql" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  administrator_login          = var.administrator_login
  administrator_login_password = length(data.azurerm_key_vault_secret.sqlhstsvc) > 0 ? data.azurerm_key_vault_secret.sqlhstsvc[0].value : var.administrator_login_password

  version = var.mssql_version

  minimum_tls_version = var.ssl_minimal_tls_version_enforced

  connection_policy = var.connection_policy

  azuread_administrator {
    login_username = var.active_directory_administrator_login_username
    object_id      = var.active_directory_administrator_object_id
    tenant_id      = var.active_directory_administrator_tenant_id
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_role_assignment" "storage" {
  count = 1

  scope                = var.keyvault_enable ? data.azurerm_storage_account.storageaccountinfo[0].id : azurerm_storage_account.mssql[0].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.mssql.identity.0.principal_id

  depends_on = [
    azurerm_mssql_server.mssql,
    azurerm_sql_firewall_rule.mssql
  ]
}

resource "azurerm_mssql_firewall_rule" "mssqlclients" {
  count               = length(var.firewall_rules)
  name                = azurerm_mssql_server.mssql.name
  server_id           = azurerm_mssql_server.mssql.id
  start_ip_address    = var.firewall_rules[count.index]
  end_ip_address      = var.firewall_rules[count.index]
}

resource "azurerm_mssql_server_extended_auditing_policy" "mssql" {
  server_id = azurerm_mssql_server.mssql.id

  storage_endpoint           = var.keyvault_enable ? data.azurerm_storage_account.storageaccountinfo[0].primary_blob_endpoint : azurerm_storage_account.mssql[0].primary_blob_endpoint
  storage_account_access_key = var.keyvault_enable ? null : azurerm_storage_account.mssql[0].primary_access_key

  retention_in_days      = var.retention_days
  log_monitoring_enabled = true

  depends_on = [
    azurerm_role_assignment.storage,
    azurerm_mssql_server_security_alert_policy.mssql
  ]
}

resource "azurerm_mssql_server_security_alert_policy" "mssql" {
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.mssql.name

  storage_endpoint           = var.keyvault_enable ? null : azurerm_storage_account.mssql[0].primary_blob_endpoint
  storage_account_access_key = var.keyvault_enable ? null : azurerm_storage_account.mssql[0].primary_access_key

  state          = "Enabled"
  retention_days = var.retention_days

  email_addresses = var.emails

  depends_on = [
    azurerm_role_assignment.storage
  ]
}

resource "azurerm_mssql_server_vulnerability_assessment" "mssql" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.mssql.id

  storage_container_path     = var.keyvault_enable ? "${data.azurerm_storage_account.storageaccountinfo[0].primary_blob_endpoint}vulnerability-assessment/" : "${azurerm_storage_account.mssql[0].primary_blob_endpoint}${azurerm_storage_container.mssql[0].name}/"
  storage_account_access_key = var.keyvault_enable ? null : azurerm_storage_account.mssql[0].primary_access_key

  recurring_scans {
    enabled                   = true
    email_subscription_admins = true
    emails                    = var.emails
  }

  depends_on = [
    azurerm_role_assignment.storage,
    azurerm_mssql_server_security_alert_policy.mssql
  ]

}

// Configure Networking
//

resource "azurerm_sql_firewall_rule" "mssql" {
  name                = "AllowAzure"
  server_id         = azurerm_mssql_server.mssql.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

}

resource "azurerm_sql_virtual_network_rule" "AllowWithinEnvironment" {
  for_each            = toset(var.list_of_subnets)
  name                = "rule${index(var.list_of_subnets, each.value)}"
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.mssql.name
  subnet_id           = each.value
}
