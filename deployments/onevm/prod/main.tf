module "rg" {
  source = "../../../modules/telenor-rg"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.servicename}-${var.environment}-${var.location_abbreviation}"
  resource_group_name = module.rg.resource_group_name
  location            = module.rg.resource_group_location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-${var.servicename}-${var.environment}-${var.location_abbreviation}"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "telenor-vm" {
  source = "../../../modules/telenor-vm"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.subnet.id
  enable_public_ip      = true
  breakglass_public_key = var.breakglass_public_key

  ssh_admin_object_ids = var.ssh_admin_object_ids
  ssh_user_object_ids  = var.ssh_user_object_ids
}
