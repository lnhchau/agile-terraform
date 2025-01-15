resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip}"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                            = "${var.application_type}-${var.resource_type}-internal"
  location                        = var.location
  resource_group_name             = var.resource_group
  size                            = "Standard_DS2_v2"
  admin_username      = "${var.admin_username}"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPyvVpGancHdw4ytXFoxkTA57nXPvWEXtSK2w00B89D3VLsPcKBLAx7EFeoGEgwPLvh46sFvZ6aQXoGCj2IiN4dn2K0FhlzFfjqWoJI27Es+untVW6lJSKcbm97OrpbH7MZX5NyvLoJ/vgjB9UJHO01fOGK2CO8ncksY/F/KTZUmFbsUp9SPtzFPSt0VG8jT2UFN20I78lYAwTwaNOQZnZDkgvG9vOyXOoFlOk7pMangyi33fEET+/s+NVvp5tMLAYNVAz8Jkrar7I0yHAyM3s8sGW8tT+PP1Jm+F7JuTN1OogdbdPLOSIF2vWMpZsGG7jdJ2382CC2EvdKZfpRDtn1NmLU9qwnnSRVlpAh6T1fV8qvktG9cajOSIvgm4UQAyAxREo8e232e7d0gh6zhHuYi+CXV/ePET14+Jpf/9xmJlsqZnBexfAtdT7/idZPK6ZxW7s2y3JKoz1udMVs8kdtU28mNubABKQAky8BlL0l2dnrm84Ge4KwP1avG/AruM= odl_user@SandboxHost-638725114068008484"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}