variable "servicename" {
  description = "The name of the service (used to name the shared resource group)"
  type        = string
}

variable "breakglass_public_key" {
  description = "OpenSSH public key for the break-glass admin SSH account. Generate externally with ssh-keygen and store the private key in Key Vault as a secret."
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, test, prod)"
  type        = string
}

variable "location_abbreviation" {
  description = "The location/region for the deployment (e.g., us, eu, as)"
  type        = string
}

variable "vms" {
  description = "Map of VM configurations keyed by a short identifier (e.g. web, api, db)"
  type = map(object({
    servicename          = string
    subnet_cidr          = string
    ssh_admin_object_ids = list(string)
    ssh_user_object_ids  = list(string)
  }))
}
