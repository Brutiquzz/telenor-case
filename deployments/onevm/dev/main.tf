module "rg" {
  source = "../../../modules/telenor-rg"

  servicename           = "someservice"
  environment           = "dev"
  location_abbreviation = "eu"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-someservice-dev-eu"
  resource_group_name = module.rg.resource_group_name
  location            = module.rg.resource_group_location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-someservice-dev-eu"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "telenor-vm" {
  source = "../../../modules/telenor-vm"

  servicename           = "someservice"
  environment           = "dev"
  location_abbreviation = "eu"
  resource_group_name   = module.rg.resource_group_name
  subnet_id             = azurerm_subnet.subnet.id
  enable_public_ip      = true
  breakglass_public_key = "PLACEHOLDER — replace with output of: ssh-keygen -t rsa -b 4096 -f breakglass-dev"

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
    "00000000-0000-0000-0000-000000000002"
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
    "00000000-0000-0000-0000-000000000004"
  ]
}
