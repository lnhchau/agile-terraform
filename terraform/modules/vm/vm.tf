resource "azurerm_network_interface" "" {
  name                = "nic0"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id_test
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.instance_ids
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = "vm0"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_DS2_v2"
  admin_username      = var.admin_username
  source_image_id                 = var.packer_image
  disable_password_authentication = true

  network_interface_ids = [
    #element(azurerm_network_interface.test.*.id, count.index)
    azurerm_network_interface.test.id
  ]

  admin_ssh_key {
    username       = var.admin_username
    public_key     = file(var.public_key_path)
  }

  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }

  tags = {
    environment  = "test"
    project_name = "QA"
    stage        = "Submission"
  }
}