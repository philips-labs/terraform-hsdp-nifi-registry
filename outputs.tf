output "nifi_registry_node" {
  description = "Container Host IP address of the nifi instance"
  value       = hsdp_container_host.nifi-registry.private_ip
}

output "nifi_registry_name_node" {
  description = "Container Host DNS names of nifi instance"
  value       = hsdp_container_host.nifi-registry.name
}

output "nifi_registry_port" {
  description = "Port where you can reach Nifi"
  value       = var.nifi_registry_port
}
