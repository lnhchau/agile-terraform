# # Azure GUIDs - Authentication Details
#variable "subscription_id" {}
#variable "client_id" {}
#variable "client_secret" {}
#variable "tenant_id" {}

# Resource Group and Location
variable "location" {
  description = "The Azure region where all resources will be deployed (e.g., 'West Europe')."
}

variable "resource_group" {
  description = "The name of the Azure resource group where resources will be created."
}

variable "application_type" {
  description = "The globally unique name for the application (used as a prefix for resources)."
}

# Network Configuration
variable "virtual_network_name" {
  description = "The name of the virtual network to be created or used."
}

variable "address_prefix_test" {
  description = "The address prefix (CIDR block) to be assigned to the test subnet."
}

variable "address_space" {
  description = "The list of address spaces (CIDR blocks) for the virtual network."
  type        = list(string)
}


# VM
variable "admin_username" {
  description = "The admin user name in the Virtual Machine."
  default     = "chaulnh"
}

variable "number_of_vms" {
  description = "The number of Virtual Machines."
  type        = number
}

variable "packer_image" {
  description = "Image ID created by the Packer tool."
  type        = string
}

variable "public_key_path" {
  description = "Full path including the filename of the public key."
  type        = string
}

variable "arm_access_key" {
  description = "Access key for Azure storage account backend"
  type        = string
}
