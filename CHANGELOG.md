## 2.0.1 (March 17, 2022)

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