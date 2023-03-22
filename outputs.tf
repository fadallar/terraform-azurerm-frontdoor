output "id" {
  description = "The ID of this Front Door Profile."
  value       = azurerm_cdn_frontdoor_profile.this.id
}

output "resource_guid" {
  description = "The UUID of this Front Door Profile which will be sent in the HTTP Header as the X-Azure-FDID attribute"
  value       = azurerm_cdn_frontdoor_profile.this.resource_guid
}

output "secrets_id" {
  description = "List of Front Door Secret Id"
  value       = { for secret in azurerm_cdn_frontdoor_secret.this : secret.name => secret.id }
}

output "endpoints_host_name" {
  description = "List of endpoint host name"
  value       = { for endpoint in azurerm_cdn_frontdoor_endpoint.this : endpoint.id => endpoint.host_name }
}

output "name" {
  description = "Frontdoor Profile Name"
  value       = azurerm_cdn_frontdoor_profile.this.name
}

