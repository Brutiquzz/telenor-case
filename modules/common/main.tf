locals {
  conventional_name = "${var.servicename}-${var.environment}-${var.location_abbreviation}" 
  locations = { 
    "us" = "East US"
    "eu" = "West Europe"
    "as" = "Southeast Asia"
    # add more locations as needed
  }
  location = lookup(local.locations, var.location_abbreviation)
}