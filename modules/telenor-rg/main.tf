module "common" {
  source = "../common"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${module.common.conventional_name}"
  location = module.common.location
}
