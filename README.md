# Terraform for Azure Managed Database MSSQL Server

Creates MSSQL Server for use with the Azure Managed Database for MSSQL.

## Security Controls

* Adheres to the [CIS Microsoft Azure Foundations Benchmark 1.3.0](https://docs.microsoft.com/en-us/azure/governance/policy/samples/cis-azure-1-3-0) for Database Services.

## Dependencies

* Terraform v0.14.x +
* Terraform AzureRM Provider 2.5 +

## Relationships

* [MSSQL](https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql)
* [MSSQL Database](https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql-database)
* [MSSQL Elasticpool](https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql-elasticpool)
* [MSSQL Server](https://github.com/canada-ca-terraform-modules/terraform-azurerm-mssql-server)

## Usage

Examples for this module along with various configurations can be found in the [examples/](examples/) folder.

## Variables

| Name                                          | Type   | Default | Required | Description                                                                  |
|-----------------------------------------------|--------|---------|----------|------------------------------------------------------------------------------|
| name                                          | string | n/a     | yes      | The name of the MSSQL Server.                                                |
| dependencies                                  | list   | n/a     | yes      | Dependency management of resources.                                          |
| retention_days                                | int    | n/a     | yes      | Specifies the retention in days for logs for this MSSQL Server. 90 days min. |
| mssql_version                                 | string | n/a     | yes      | The version of the MSSQL Server.                                             |
| location                                      | string | n/a     | yes      | Specifies the supported Azure location where the resource exists.            |
| resource_group                                | string | n/a     | yes      | The name of the resource group in which to create the MSSQL Server.          |
| list_of_subnets                               | list   | n/a     | yes      | List of subnets (local.backCCSubnetRef, local.midCCsubnetRef etc.)           |
| environment                                   | string | n/a     | yes      | The name of the subscription (dev, test, uat, qa, production.)               |
| ssl_minimal_tls_version_enforced              | string | n/a     | yes      | The mimimun TLS version to support on the sever.                             |
| firewall_rules                                | list   | n/a     | yes      | List the IPs that are allowed.                                               |
| active_directory_administrator_login_username | string | n/a     | yes      | The Active Directory Administrator Login Username.                           |
| active_directory_administrator_object_id      | string | n/a     | yes      | The Active Directory Administrator Object ID.                                |
| active_directory_administrator_tenant_id      | string | n/a     | yes      | The Active Directory Administrator Tenant ID.                                |
| emails                                        | list   | n/a     | yes      | List of email addresses that should recieve the security reports.            |
| kv_name                                       | string | n/a     | yes      | The keyvault name.                                                           |
| kv_rg                                         | string | n/a     | yes      | The keyvault resource group.                                                 |
| storageaccountinfo_resource_group_name        | string | n/a     | yes      | The storageaccountinfo resource group name.                                  |

## History

| Date     | Release    | Change                                |
|----------|------------|---------------------------------------|
| 20210509 | 20210509.1 | The v1.0.0 relase of Terraform module |
