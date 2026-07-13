module "rg" {
  source = "../../../modules/telenor-rg"

  servicename           = "platform"
  environment           = "dev"
  location_abbreviation = "eu"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-platform-dev-eu"
  resource_group_name = module.rg.resource_group_name
  location            = module.rg.resource_group_location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet_web" {
  name                 = "snet-web-dev-eu"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "snet_api" {
  name                 = "snet-api-dev-eu"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "snet_db" {
  name                 = "snet-db-dev-eu"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

module "vm_web" {
  source = "../../../modules/telenor-vm"

  servicename           = "web"
  environment           = "dev"
  location_abbreviation = "eu"
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.snet_web.id
  enable_public_ip      = true
  breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-dev"

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
  ]
}

module "vm_api" {
  source = "../../../modules/telenor-vm"

  servicename           = "api"
  environment           = "dev"
  location_abbreviation = "eu"
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.snet_api.id
  enable_public_ip      = true
  breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-dev"

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
  ]
}

module "vm_db" {
  source = "../../../modules/telenor-vm"

  servicename           = "db"
  environment           = "dev"
  location_abbreviation = "eu"
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.snet_db.id
  enable_public_ip      = true
  breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-dev"

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
  ]
}
