resource "azurerm_private_endpoint" "pep" {
  count               = var.enable_private_endpoint == true ? 1 : 0
  name                = format("pe-%s", local.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = merge(var.default_tags, var.extra_tags)
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  private_service_connection {
    name                           = "appconfigprivatelink"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_app_configuration.appconf.id
    subresource_names              = ["configurationStores"]
  }

  lifecycle {
    precondition {
      condition     = var.enable_private_endpoint && (var.private_endpoint_subnet_id != null && var.private_dns_zone_id != null)
      error_message = "private_endpoint_subnet_id and private_dns_zone_id are mandatory when enable private endpoint is true."
    }
  }
}

