variable "servicename" {
  description = "The name of the service"
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

variable "breakglass_public_key" {
  description = "OpenSSH public key for the break-glass admin SSH account. Generate externally with ssh-keygen and store the private key in Key Vault as a secret."
  type        = string
}

variable "ssh_admin_object_ids" {
  description = "List of Entra ID object IDs to grant Virtual Machine Administrator Login (sudo) access via az ssh vm"
  type        = list(string)
  default     = []
}

variable "ssh_user_object_ids" {
  description = "List of Entra ID object IDs to grant Virtual Machine User Login (non-sudo) access via az ssh vm"
  type        = list(string)
  default     = []
}
