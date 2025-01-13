provider "azurerm" {
  tenant_id       = "${var.tenant_id}" # update to run locally
  subscription_id = "${var.subscription_id}" # update to run locally
  client_id       = "${var.client_id}" # update to run locally
  client_secret   = "${var.client_secret}" # update to run locally
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfstate323512575"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    # access_key           = 
  }
}
module "resource_group" { # comment to run locally
  source               = "../../modules/resource_group"
  resource_group       = var.resource_group
  location             = var.location
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${var.resource_group}"
  address_prefixes     = "${var.address_prefixes}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = var.location
  application_type = var.application_type
  resource_type    = "NSG"
  resource_group   = var.resource_group
  subnet_id        = module.network.subnet_id_test
  address_prefix_test = "${var.address_prefix_test}"
}

module "appservice" {
  source           = "../../modules/appservice"
  location         = var.location
  application_type = var.application_type
  resource_type    = "AppService"
  resource_group   = var.resource_group
}

module "publicip" {
  source           = "../../modules/publicip"
  location         = var.location
  application_type = "${var.application_type}"
  resource_type    = "PublicIP"
  resource_group   = var.resource_group
}

module "vm" {
  source           = "../../modules/vm"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "VirtualMachine"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip        = "${module.publicip.public_ip_address_id}"
  admin_username   = "${var.admin_username}"
  admin_password   = "${var.admin_password}"
  public_key       = "${var.public_key}"
}