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
