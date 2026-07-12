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

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file for the admin user"
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