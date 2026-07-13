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

variable "purge_protection_enabled" {
  description = "Enable purge protection on the Key Vault. Should be true in production."
  type        = bool
  default     = false
}

variable "admin_object_ids" {
  description = "List of Entra ID object IDs granted Key Vault Crypto User access"
  type        = list(string)
  default     = []
}
