module "common" {
  source = "../common"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

resource "azurerm_public_ip" "pip" {
  count = var.enable_public_ip ? 1 : 0

  name                = "pip-${module.common.conventional_name}"
  resource_group_name = var.resource_group_name
  location            = module.common.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1", "2", "3"]
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-${module.common.conventional_name}"
  resource_group_name = var.resource_group_name
  location            = module.common.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enable_public_ip ? azurerm_public_ip.pip[0].id : null
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "vm-${module.common.conventional_name}"
  resource_group_name             = var.resource_group_name
  location                        = module.common.location
  size                            = "Standard_B1s"
  admin_username                  = var.admin_username
  zone                            = "1,2,3"

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.breakglass_public_key
  }

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "24.04-LTS"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_virtual_machine_extension" "aad_ssh_login" {
  name                       = "AADSSHLoginForLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm.id
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADSSHLoginForLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}

resource "azurerm_role_assignment" "ssh_admin_login" {
  for_each = toset(var.ssh_admin_object_ids)

  scope                = azurerm_linux_virtual_machine.vm.id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "ssh_user_login" {
  for_each = toset(var.ssh_user_object_ids)

  scope                = azurerm_linux_virtual_machine.vm.id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = each.value
}
