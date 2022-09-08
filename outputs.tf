output "id" {
  value = azurerm_mssql_server.mssql.id
}

output "name" {
  value = azurerm_mssql_server.mssql.name
}

output "identity_tenant_id" {
  value = azurerm_mssql_server.mssql.identity[0].tenant_id
}

output "identity_object_id" {
  value = azurerm_mssql_server.mssql.identity[0].principal_id
}

output "sa_primary_blob_endpoint" {
  value = azurerm_mssql_server_extended_auditing_policy.this.storage_endpoint
}

output "sa_primary_access_key" {
  value = var.kv_enable ? null : azurerm_mssql_server_extended_auditing_policy.this.storage_account_access_key
}

output "assessment_id" {
  value = azurerm_mssql_server_vulnerability_assessment.this.id
}

output "firewall" {
  value = azurerm_mssql_firewall_rule.mssqlclients
}
