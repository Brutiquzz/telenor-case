variable "servicename" {
  description = "The name of the service"
  type        = string

  validation {
    condition     = length(var.servicename) > 0
    error_message = "The service name must not be empty."
  }
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, test, prod)"
  type        = string

  validation {
    condition     = length(var.environment) > 0
    error_message = "The environment must not be empty."
  }
}

variable "location_abbreviation" {
  description = "The location/region for the deployment (e.g., us, eu, as)"
  type        = string

  validation {
    condition     = length(var.location_abbreviation) > 0
    error_message = "The location abbreviation must not be empty."
  }
}

# add more variable to enforce convetions like tagging...  