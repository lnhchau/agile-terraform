# Azure GUIDs - Authentication Details
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Resource Group and Location
variable "location" {}
variable "resource_group" {}
variable "application_type" {}

# Network
variable virtual_network_name {}
# variable address_prefixes {}
variable address_prefix_test {}
variable address_space {}

# VM
variable "vm_size" {}
variable "vm_admin_username" {}
variable "packer_image_name" {}
variable "packer_image" {}
variable "public_key_path" {}
variable "public_key" {}