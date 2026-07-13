module "keyvault" {
  source = "../../modules/telenor-keyvault"

  servicename           = "ssh"
  environment           = "dev"
  location_abbreviation = "eu"
}

module "telenor-vm" {
  source = "../../modules/telenor-vm"

  servicename           = "someservice"
  environment           = "dev"
  location_abbreviation = "eu"
  key_vault_id          = module.keyvault.key_vault_id

  ssh_admin_object_ids = [
    "00000000-0000-0000-0000-000000000001",
    "00000000-0000-0000-0000-000000000002"
  ]

  ssh_user_object_ids = [
    "00000000-0000-0000-0000-000000000003",
    "00000000-0000-0000-0000-000000000004"
  ]
}
