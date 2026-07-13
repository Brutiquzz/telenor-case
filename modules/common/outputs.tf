output "conventional_name" {
  value       = local.conventional_name
  description = "The conventional resource name composed of servicename-environment-location"
}

output "location" {
  value       = local.location
  description = "The full Azure region name resolved from the location abbreviation"
}
