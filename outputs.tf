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
  value = azurerm_mssql_server_extended_auditing_policy.mssql.storage_endpoint
}

output "sa_primary_access_key" {
  value = var.keyvault_enable ? null : azurerm_mssql_server_extended_auditing_policy.mssql.storage_account_access_key
}

output "assessment_id" {
  value = azurerm_mssql_server_vulnerability_assessment.mssql.id
}

output "firewall" {
  value = azurerm_sql_firewall_rule.mssqlclients
}

# Part of a hack for module-to-module dependencies.
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
# and
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-473091030
output "depended_on" {
  value = "${null_resource.dependency_setter.id}-${timestamp()}"
}
