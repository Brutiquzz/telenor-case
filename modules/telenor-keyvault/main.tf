module "common" {
  source = "../common"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-kv-${module.common.conventional_name}"
  location = module.common.location
}

resource "azurerm_key_vault" "kv" {
  name                       = "kv-${module.common.conventional_name}"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  rbac_authorization_enabled = true
  soft_delete_retention_days = 7
  purge_protection_enabled   = var.purge_protection_enabled
}

# Allow the Terraform service principal to create and manage keys
resource "azurerm_role_assignment" "terraform_crypto_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Crypto Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Allow admins to perform crypto operations — private key remains non-exportable inside Key Vault
resource "azurerm_role_assignment" "admin_crypto_user" {
  for_each = toset(var.admin_object_ids)

  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Crypto User"
  principal_id         = each.value
}
