module "keyvault" {
  source = "../../modules/telenor-keyvault"

  servicename           = "ssh"
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

module "telenor-vm" {
  source = "../../modules/telenor-vm"

  servicename           = var.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
  key_vault_id          = module.keyvault.key_vault_id

  ssh_admin_object_ids = var.ssh_admin_object_ids
  ssh_user_object_ids  = var.ssh_user_object_ids
}
