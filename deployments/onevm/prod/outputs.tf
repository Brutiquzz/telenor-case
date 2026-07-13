output "name" {
  value       = module.telenor-vm.name
  description = "The conventional name of the virtual machine"
}

output "public_ip_address" {
  value       = module.telenor-vm.public_ip_address
  description = "The public IP address of the virtual machine"
}

output "private_ip_address" {
  value       = module.telenor-vm.private_ip_address
  description = "The private IP address of the virtual machine"
}

output "resource_group_name" {
  value       = module.telenor-vm.resource_group_name
  description = "The name of the resource group"
}

output "vm_id" {
  value       = module.telenor-vm.vm_id
  description = "The resource ID of the virtual machine"
}

output "vm_principal_id" {
  value       = module.telenor-vm.vm_principal_id
  description = "The system-assigned managed identity principal ID of the virtual machine"
}
