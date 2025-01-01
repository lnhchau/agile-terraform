provider "azurerm" {
  # tenant_id       = "${var.tenant_id}"
  # subscription_id = "${var.subscription_id}"
  # client_id       = "${var.client_id}"
  # client_secret   = "${var.client_secret}"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfstate1605014538"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    # access_key           = "" # var ARM_ACCESS_KEY
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = var.resource_group
  location             = var.location
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = var.location
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = var.resource_group
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = var.location
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = var.resource_group
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = var.location
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = var.resource_group
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = var.location
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = var.resource_group
}

module "vm" {
  source               = "../../modules/vm"
  number_of_vms        = var.number_of_vms
  location             = var.location
  resource_group       = var.resource_group
  resource_type        = "vm"

  admin_username       = var.admin_username
  subnet_id_test       = module.network.subnet_id_test
  instance_ids         = module.publicip.public_ip_address_id
  packer_image         = var.packer_image
  public_key_path      = var.public_key_path
}