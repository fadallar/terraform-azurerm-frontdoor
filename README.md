# Azure Front Door
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/)

This Terraform module creates an Azure Front Door Profile

  - It applies diagnostics settings  
  - It configures a private endpoint if private access is enabled
  - It configures user managed identities scoped at the Appconfiguration Store

> Important  
> Ensures you have the required permissions to associate a role to a user managed identity  

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

## Related documentation

Microsoft Azure documentation: [Azure Front Door](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview).
