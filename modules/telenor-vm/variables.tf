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

variable "admin_username" {
  description = "Local admin username on the VM (used as bootstrap account; day-to-day access is via Entra ID SSH)"
  type        = string
  default     = "azureuser"
}

variable "key_vault_id" {
  description = "Resource ID of the Key Vault in which the VM's SSH key pair will be created"
  type        = string
}