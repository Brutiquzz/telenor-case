output "vm_names" {
  value       = { for k, v in module.telenor-vm : k => v.name }
  description = "Conventional names of all deployed VMs"
}

output "vm_public_ip_addresses" {
  value       = { for k, v in module.telenor-vm : k => v.public_ip_address }
  description = "Public IP addresses of all deployed VMs"
}

output "vm_private_ip_addresses" {
  value       = { for k, v in module.telenor-vm : k => v.private_ip_address }
  description = "Private IP addresses of all deployed VMs"
}

output "vm_resource_group_names" {
  value       = { for k, v in module.telenor-vm : k => v.resource_group_name }
  description = "Resource group names of all deployed VMs"
}

output "vm_ids" {
  value       = { for k, v in module.telenor-vm : k => v.vm_id }
  description = "Resource IDs of all deployed VMs"
}

output "vm_principal_ids" {
  value       = { for k, v in module.telenor-vm : k => v.vm_principal_id }
  description = "System-assigned managed identity principal IDs of all deployed VMs"
}
