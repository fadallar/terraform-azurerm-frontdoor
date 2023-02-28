variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
  validation {
    condition     = var.custom_name == "" || can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.custom_name))
    error_message = "Invalid variable: ${var.custom_name}. Variable name must start with a lowercase letter, end with an alphanumeric lowercase character, and contain only lowercase letters, digits, or a dash (-)."
  }
}

variable "sku_name" {
  description = "Specifies the SKU for this Front Door Profile. Possible values include Standard_AzureFrontDoor and Premium_AzureFrontDoor. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard_AzureFrontDoor"
  validation {
    condition     = contains(["Standard_AzureFrontDoor", "Premium_AzureFrontDoor"], var.sku_name)
    error_message = "Invalid variable: ${var.sku_name}. SKU name used is not valid"
  }
}

variable "response_timeout_seconds" {
  description = "Specifies the maximum response timeout in seconds. Possible values are between 16 and 240 seconds (inclusive)"
  type        = number
  default     = 120
  validation {
    condition     = var.response_timeout_seconds >= 16 && var.response_timeout_seconds <= 240
    error_message = "Invalid variable: ${var.response_timeout_seconds}. Allowed range is 16-240."
  }
}

variable "secrets_list" {
  description = "List of secrets. Secrests are defined as a map with two kyes:  name and certificate_id.  Certificate Id is Key Vault Certificate Id"
  type        = list(object)
  default     = null
}

variable "endpoints_list" {
  description = "List of endpoints. Endpoints are defined as a map with two keys: name and enabled. enabled is a boolean"
  type        = list(object)
  default     = null
  ### TO-DO Validate Endpoint name
}