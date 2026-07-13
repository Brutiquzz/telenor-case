# vm_web outputs
output "vm_web_name" {
  value       = module.vm_web.name
  description = "The conventional name of the web VM"
}

output "vm_web_public_ip_address" {
  value       = module.vm_web.public_ip_address
  description = "The public IP address of the web VM"
}

output "vm_web_private_ip_address" {
  value       = module.vm_web.private_ip_address
  description = "The private IP address of the web VM"
}

output "vm_web_resource_group_name" {
  value       = module.vm_web.resource_group_name
  description = "The resource group of the web VM"
}

# vm_api outputs
output "vm_api_name" {
  value       = module.vm_api.name
  description = "The conventional name of the api VM"
}

output "vm_api_public_ip_address" {
  value       = module.vm_api.public_ip_address
  description = "The public IP address of the api VM"
}

output "vm_api_private_ip_address" {
  value       = module.vm_api.private_ip_address
  description = "The private IP address of the api VM"
}

output "vm_api_resource_group_name" {
  value       = module.vm_api.resource_group_name
  description = "The resource group of the api VM"
}

# vm_db outputs
output "vm_db_name" {
  value       = module.vm_db.name
  description = "The conventional name of the db VM"
}

output "vm_db_public_ip_address" {
  value       = module.vm_db.public_ip_address
  description = "The public IP address of the db VM"
}

output "vm_db_private_ip_address" {
  value       = module.vm_db.private_ip_address
  description = "The private IP address of the db VM"
}

output "vm_db_resource_group_name" {
  value       = module.vm_db.resource_group_name
  description = "The resource group of the db VM"
}
