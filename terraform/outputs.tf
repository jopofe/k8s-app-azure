output "resource_group_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.rg.id # Resource Group ID
}

output "vm_id_master" {
  description = "VM ID"
  value       = azurerm_linux_virtual_machine.vm_master.id # VMs ID
}

output "vm_id_worker" {
  description = "VM ID"
  value       = azurerm_linux_virtual_machine.vm_worker.id
}

output "vm_id_nfs" {
  description = "VM ID"
  value       = azurerm_linux_virtual_machine.vm_nfs.id
}

output "private_ip_master" {
  description = "Private IP"
  value       = azurerm_network_interface.nic_master.private_ip_address # La IP privada
}

output "private_ip_worker" {
  description = "Private IP"
  value       = azurerm_network_interface.nic_worker.private_ip_address
}

output "private_ip_nfs" {
  description = "Private IP"
  value       = azurerm_network_interface.nic_nfs.private_ip_address
}

output "public_ip_master" {
  description = "Public IP"
  value       = azurerm_public_ip.ip_public_master.ip_address # Necesito obtener la iP Pública para poder acceder a través de ANSIBLE
}

output "public_ip_worker" {
  description = "Public IP"
  value       = azurerm_public_ip.ip_public_worker.ip_address
}

output "public_ip_nfs" {
  description = "Public IP"
  value       = azurerm_public_ip.ip_public_nfs.ip_address
}
