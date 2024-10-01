variable "name" {
  description = "The name of the MSSQL Server"
}

variable "administrator_login" {
  description = "(Required) The Administrator Login for the MSSQL Server"
}

variable "administrator_login_password" {
  description = "(Required) The Password associated with the administrator_login for the PostgreSQL Server."
}

variable "retention_days" {
  description = "Specifies the retention in days for logs for this MSSQL Server"
  default     = 90
}

variable "mssql_version" {
  description = "The version of the MSSQL Server"
  default     = "12.0"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the MSSQL Server"
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The mimimun TLS version to support on the sever"
  default     = "1.2"
}

variable "connection_policy" {
  description = "The connection policy the server will use (Default, Proxy or Redirect)"
  default     = "Default"
}

variable "environment" {
  description = "The environment used for keyvault access"
}

variable "firewall_rules" {
  type        = list(string)
  description = "Specifies the Start IP Address associated with this Firewall Rule"
}

variable "subnets" {
  default = []
}

variable "active_directory_administrator_login_username" {
  description = "The Active Directory Administrator Login Username"
  default     = ""
}

variable "active_directory_administrator_object_id" {
  description = "The Active Directory Administrator Object ID"
  default     = ""
}

variable "active_directory_administrator_tenant_id" {
  description = "The Active Directory Administrator Tenant ID"
  default     = ""
}

variable "emails" {
  type        = list(string)
  description = "List of email addresses that should recieve the security reports"
  default     = []
}

variable "kv_name" {
  description = "The keyvault name"
  default     = ""
}

variable "kv_rg" {
  description = "The keyvault resource group"
  default     = ""
}

variable "sa_resource_group_name" {
  description = "The storageaccountinfo resource group name"
  default     = ""
}

variable "kv_enable" {
  description = "(Optional) Enable Key Vault for passwords."
  default     = false
}

variable "private_endpoints" {
  description = "(Optional) Options to enable private endpoint"
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to this Virtual Machine"
  type        = map(string)
  default     = null
}

variable "primary_mi_id" {
  description = "(Optional) The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  default     = null
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "LRS"
}

variable "express_va_enabled" {
  description = "Is Express configuration of Vulnerability settings on Microsoft Cloud Defender being used?"
  default     = true
}