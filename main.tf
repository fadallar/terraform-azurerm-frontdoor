resource "azurerm_cdn_frontdoor_profile" "this" {
  name                     = local.name
  resource_group_name      = var.resource_group_name
  sku_name                 = var.sku_name
  response_timeout_seconds = var.response_timeout_seconds

  tags = merge(var.default_tags, var.extra_tags)

}

resource "azurerm_cdn_frontdoor_secret" "this" {
  for_each                 = { for secret in var.secrets_list : secret.name => secret }
  name                     = each.value.name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id

  secret {
    customer_certificate {
      key_vault_certificate_id = each.value.certificate_id
    }
  }
}

resource "azurerm_cdn_frontdoor_endpoint" "this" {
  for_each                 = { for endpoint in var.endpoints_list : endpoint.name => endpoint }
  name                     = each.value.name
  enabled                  = each.value.enabled
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
  tags                     = merge(var.default_tags, var.extra_tags)

}
