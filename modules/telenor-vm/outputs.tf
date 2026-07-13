output "name" {
  value       = module.common.conventional_name
  description = "The conventional name of the virtual machine"
}

output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "The public IP address of the virtual machine"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "The private IP address of the virtual machine"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The resource ID of the virtual machine"
}

output "vm_principal_id" {
  value       = azurerm_linux_virtual_machine.vm.identity[0].principal_id
  description = "The system-assigned managed identity principal ID of the virtual machine"
}

