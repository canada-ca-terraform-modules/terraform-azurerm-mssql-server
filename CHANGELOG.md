## 2.0.3 (Jan 10, 2024)

FEATURES:
Supports inheiretance of Express Vulnarability Assesment settings 
ENHANCEMENTS:

BUG FIXES:
* `azurerm_role_assignment` - made optional for Express VA Configuration
* `azurerm_mssql_server_security_alert_policy` -  made optional for Express VA Configuration
* `azurerm_mssql_server_extended_auditing_policy` -  made optional for Express VA Configuration
* `azurerm_mssql_server_vulnerability_assessment` -  made optional for Express VA Configuration

## 2.0.2 (July 5, 2023)

FEATURES:

ENHANCEMENTS:
* `azurerm_storage_account` - account_replication_type made variable 
* `azurerm_private_endpoint` - multiple endpoints can be created

BUG FIXES:
* `azurerm_role_assignment` - user assigned managed identity upon recreation made persistent

## 2.0.1 (March 17, 2023)

FEATURES:

ENHANCEMENTS:
* `azurerm_sql_firewall_rule` - remove AllowSTC rule
* \examples - updated documentation 

BUG FIXES:
* `azurerm_private_endpoint` - uses existing private zone DNS
* `azurerm_role_assignment` - can use existing user assigned managed identity


## 2.0.0 (November 3, 2022)

FEATURES:
* New Resource: azurerm_private_endpoint

ENHANCEMENTS:
* `azurerm_sql_firewall_rule` - switch to `azurerm_mssql_firewall_rule`
* `azurerm_sql_virtual_network_rule` - switch to `azurerm_mssql_virtual_network_rule`

BUG FIXES:
* `azurerm_role_assignment` - uses the storage account passed in