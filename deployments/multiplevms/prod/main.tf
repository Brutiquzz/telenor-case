module "keyvault" {
  source = "../../../modules/telenor-keyvault"

  servicename           = "ssh"
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
}

module "telenor-vm" {
  source   = "../../../modules/telenor-vm"
  for_each = var.vms

  servicename           = each.value.servicename
  environment           = var.environment
  location_abbreviation = var.location_abbreviation
  key_vault_id          = module.keyvault.key_vault_id

  ssh_admin_object_ids = each.value.ssh_admin_object_ids
  ssh_user_object_ids  = each.value.ssh_user_object_ids
}
