module "keyvault" {
  source = "../../../modules/telenor-keyvault"

  servicename           = "ssh"
  environment           = "dev"
  location_abbreviation = "eu"
}

module "vm_web" {
  source = "../../../modules/telenor-vm"

  servicename           = "web"
  environment           = "dev"
  location_abbreviation = "eu"
  key_vault_id          = module.keyvault.key_vault_id

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
  key_vault_id          = module.keyvault.key_vault_id

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
  key_vault_id          = module.keyvault.key_vault_id

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
  ]
}
