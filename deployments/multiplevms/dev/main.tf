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
  breakglass_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2Ub7KWc30BJVXGKsdQumPM9XhhxZx7tHWDL6p9//gUJwxiYD59MwycirQ3IODaV11AUhaczQDMQ8l/fc+IdKWpChblBa7z5jaftOsMLjnNacGiSoVrBhDJr/RKTPD4kH+8RcMgqu7uhDHSYbbO3kG8zmOtdPp9CwKnChsA9HRuDr2Qa6uEQDja/Zr+PM/mMEHLwvwuRaCSb1ree2AfFwecSKhrE9iYhpxO44g5p5u7hSMKoB1fzKc2755gtUEINvDzbp4HC0JspddEif4Sr/8t8cm0FVOWQw01maHx0apcV4sS0pLReA1kkVcAb+8ICMLYPCRkD6hrsuHrRxVzDiwhSEVHUezXH6pcq6MdGcPDE67Xnz3H3OzoMF5NAgv9utg4QpWxBGOng3jvw2nfwDRHoDynkKyN3E0aWRYlZu6ZVyJzS10uEr7b2R5NKDzDqoqOwoqqAqArHGrC4+sHqAldB3itwGyH5gz4F99lyuA9+15q64grmrvfnFnjB8btpACAgxa9753fCiDoYOZdqRoDkDd94gWqqTK9ooxbI/kE25xyMjEQF9FZ/asLyZMiC5QkYM64XSE0rytu4i9dTSqfmGx7SE26dc0edQdce0f5gFapEmXsEi+bZKar+65scUgsBExRRjBn6iFqU156kqyNZWKAbj0bIy4g4gtBGzbMw== breakglass-dev"

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
  breakglass_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2Ub7KWc30BJVXGKsdQumPM9XhhxZx7tHWDL6p9//gUJwxiYD59MwycirQ3IODaV11AUhaczQDMQ8l/fc+IdKWpChblBa7z5jaftOsMLjnNacGiSoVrBhDJr/RKTPD4kH+8RcMgqu7uhDHSYbbO3kG8zmOtdPp9CwKnChsA9HRuDr2Qa6uEQDja/Zr+PM/mMEHLwvwuRaCSb1ree2AfFwecSKhrE9iYhpxO44g5p5u7hSMKoB1fzKc2755gtUEINvDzbp4HC0JspddEif4Sr/8t8cm0FVOWQw01maHx0apcV4sS0pLReA1kkVcAb+8ICMLYPCRkD6hrsuHrRxVzDiwhSEVHUezXH6pcq6MdGcPDE67Xnz3H3OzoMF5NAgv9utg4QpWxBGOng3jvw2nfwDRHoDynkKyN3E0aWRYlZu6ZVyJzS10uEr7b2R5NKDzDqoqOwoqqAqArHGrC4+sHqAldB3itwGyH5gz4F99lyuA9+15q64grmrvfnFnjB8btpACAgxa9753fCiDoYOZdqRoDkDd94gWqqTK9ooxbI/kE25xyMjEQF9FZ/asLyZMiC5QkYM64XSE0rytu4i9dTSqfmGx7SE26dc0edQdce0f5gFapEmXsEi+bZKar+65scUgsBExRRjBn6iFqU156kqyNZWKAbj0bIy4g4gtBGzbMw== breakglass-dev"

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
  breakglass_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2Ub7KWc30BJVXGKsdQumPM9XhhxZx7tHWDL6p9//gUJwxiYD59MwycirQ3IODaV11AUhaczQDMQ8l/fc+IdKWpChblBa7z5jaftOsMLjnNacGiSoVrBhDJr/RKTPD4kH+8RcMgqu7uhDHSYbbO3kG8zmOtdPp9CwKnChsA9HRuDr2Qa6uEQDja/Zr+PM/mMEHLwvwuRaCSb1ree2AfFwecSKhrE9iYhpxO44g5p5u7hSMKoB1fzKc2755gtUEINvDzbp4HC0JspddEif4Sr/8t8cm0FVOWQw01maHx0apcV4sS0pLReA1kkVcAb+8ICMLYPCRkD6hrsuHrRxVzDiwhSEVHUezXH6pcq6MdGcPDE67Xnz3H3OzoMF5NAgv9utg4QpWxBGOng3jvw2nfwDRHoDynkKyN3E0aWRYlZu6ZVyJzS10uEr7b2R5NKDzDqoqOwoqqAqArHGrC4+sHqAldB3itwGyH5gz4F99lyuA9+15q64grmrvfnFnjB8btpACAgxa9753fCiDoYOZdqRoDkDd94gWqqTK9ooxbI/kE25xyMjEQF9FZ/asLyZMiC5QkYM64XSE0rytu4i9dTSqfmGx7SE26dc0edQdce0f5gFapEmXsEi+bZKar+65scUgsBExRRjBn6iFqU156kqyNZWKAbj0bIy4g4gtBGzbMw== breakglass-dev"

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
  ]
}
