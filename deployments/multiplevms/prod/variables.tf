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
    ssh_admin_object_ids = list(string)
    ssh_user_object_ids  = list(string)
  }))
}
