# Terraform for Azure Managed Database MSSQL Server

Creates MSSQL Server for use with the Azure Managed Database for MSSQL.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.AllowAzure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_firewall_rule.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_firewall_rule.mssqlclients](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_vulnerability_assessment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_vulnerability_assessment) | resource |
| [azurerm_mssql_virtual_network_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_network_rule) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_key_vault.sqlhstkv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.sqlhstsvc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.storageaccountname](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_storage_account.storageaccountinfo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subnet.Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.Vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_administrator_login_username"></a> [active\_directory\_administrator\_login\_username](#input\_active\_directory\_administrator\_login\_username) | The Active Directory Administrator Login Username | `string` | `""` | no |
| <a name="input_active_directory_administrator_object_id"></a> [active\_directory\_administrator\_object\_id](#input\_active\_directory\_administrator\_object\_id) | The Active Directory Administrator Object ID | `string` | `""` | no |
| <a name="input_active_directory_administrator_tenant_id"></a> [active\_directory\_administrator\_tenant\_id](#input\_active\_directory\_administrator\_tenant\_id) | The Active Directory Administrator Tenant ID | `string` | `""` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The Administrator Login for the MSSQL Server | `string` | `"sqlhstsvc"` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | (Required) The Password associated with the administrator\_login for the PostgreSQL Server. | `any` | n/a | yes |
| <a name="input_connection_policy"></a> [connection\_policy](#input\_connection\_policy) | The connection policy the server will use (Default, Proxy or Redirect) | `string` | `"Default"` | no |
| <a name="input_dependencies"></a> [dependencies](#input\_dependencies) | Dependency management of resources | `list(string)` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | List of email addresses that should recieve the security reports | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for keyvault access | `any` | n/a | yes |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Specifies the Start IP Address associated with this Firewall Rule | `list(string)` | n/a | yes |
| <a name="input_kv_enable"></a> [kv\_enable](#input\_kv\_enable) | (Optional) Enable Key Vault for passwords. | `bool` | `false` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | The keyvault name | `string` | `""` | no |
| <a name="input_kv_rg"></a> [kv\_rg](#input\_kv\_rg) | The keyvault resource group | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | `"canadacentral"` | no |
| <a name="input_mssql_version"></a> [mssql\_version](#input\_mssql\_version) | The version of the MSSQL Server | `string` | `"12.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the MSSQL Server | `any` | n/a | yes |
| <a name="input_private_endpoint_subnet"></a> [private\_endpoint\_subnet](#input\_private\_endpoint\_subnet) | (Optional) Options to enable private endpoint | `list` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the MSSQL Server | `any` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Specifies the retention in days for logs for this MSSQL Server | `number` | `90` | no |
| <a name="input_sa_resource_group_name"></a> [sa\_resource\_group\_name](#input\_sa\_resource\_group\_name) | The storageaccountinfo resource group name | `string` | `""` | no |
| <a name="input_ssl_minimal_tls_version_enforced"></a> [ssl\_minimal\_tls\_version\_enforced](#input\_ssl\_minimal\_tls\_version\_enforced) | The mimimun TLS version to support on the sever | `string` | `"1.2"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assessment_id"></a> [assessment\_id](#output\_assessment\_id) | n/a |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_identity_object_id"></a> [identity\_object\_id](#output\_identity\_object\_id) | n/a |
| <a name="output_identity_tenant_id"></a> [identity\_tenant\_id](#output\_identity\_tenant\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_sa_primary_access_key"></a> [sa\_primary\_access\_key](#output\_sa\_primary\_access\_key) | n/a |
| <a name="output_sa_primary_blob_endpoint"></a> [sa\_primary\_blob\_endpoint](#output\_sa\_primary\_blob\_endpoint) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

Examples for this module along with various configurations can be found in the [examples/](examples/) folder.

## Security Controls

* Adheres to the [CIS Microsoft Azure Foundations Benchmark 1.3.0](https://docs.microsoft.com/en-us/azure/governance/policy/samples/cis-azure-1-3-0) for Database Services.

## History

| Date     | Release    | Change                                                                       |
|----------|------------|------------------------------------------------------------------------------|
| 20210628 | 20210628.1 | The v1.1.0 release adds keyvaults for secrets and VA baselines               |
| 20210512 | 20210512.1 | The v1.0.1 release of Terraform module adding optional key vault integration |
| 20210509 | 20210509.1 | The v1.0.0 release of Terraform module                                       |
