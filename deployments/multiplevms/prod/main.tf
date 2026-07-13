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

resource "azurerm_subnet" "subnets" {
  for_each = var.vms

  name                 = "snet-${each.value.servicename}-${var.environment}-${var.location_abbreviation}"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.subnet_cidr]
}

module "telenor-vm" {
  source   = "../../../modules/telenor-vm"
  for_each = var.vms

  servicename           = each.value.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.subnets[each.key].id
  enable_public_ip      = true
  breakglass_public_key = var.breakglass_public_key

  ssh_admin_object_ids = each.value.ssh_admin_object_ids
  ssh_user_object_ids  = each.value.ssh_user_object_ids
}
