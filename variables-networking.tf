variable "allowed_subnets" {
  description = "List of VNet/Subnet IDs to allow on the registry."
  default     = []
  type        = list(string)
}

variable "allowed_cidrs" {
  description = "List of CIDRs to allow on the registry"
  default     = []
  type        = list(string)
}

variable "public_network_access_enabled" {
  description = "Whether the app configuration is accessible publicly."
  type        = bool
  default     = false
}


variable "enable_private_endpoint" {
  description = "Wether the app configuration is using a private endpoint"
  type        = bool
  default     = true
}

variable "private_dns_zone_id" {
  description = "Id of the private DNS Zone  to be used by the app configuration private endpoint"
  type        = string
  default     = null
}

variable "private_endpoint_subnet_id" {
  description = "Id for the subnet used by the app configuration private endpoint"
  type        = string
  default     = null
}