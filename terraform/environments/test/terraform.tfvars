# Azure subscription vars
subscription_id = "850c12f5-152f-4692-a8e9-2a5d3b9f39db"
client_id = "3db2dd70-0372-4b1f-8d79-d6e7f1c26454"
client_secret = "guk8Q~RpP24vBS4NJU4aU5OcP6Amjidxh76aLd"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"

# Reso urce Group/Location
location = "East US"
resource_group = "Azuredevops"
application_type = "myapp"

# Network
virtual_network_name = "myNetwork"
address_space = ["10.5.0.0/16"]
address_prefixes = ["10.5.1.0/24"]
address_prefix_test = "10.5.1.0/24"


# VM
admin_username = "chaulnh"
admin_password = "password@123456"
# number_of_vms = 2
# packer_image = "/subscriptions/51003162-956a-4e6f-877b-3d0d913c7ca1/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
arm_access_key = "CDt+XbSb3NCnigukP02x9g+c93hrRUBdLNPex4Z3t/rFrCARA7EMczktIQygsXwFLnIdaCyuDI9g+AStKuSd2Q=="


# SSH key
public_key_path = "/home/chaulnh/work/_temp/id_rsa.pub"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDd0EPDM/9A1o811mCfISjd0YjXBrp5W043OCYHDgoOeZr8GY3U0xuSOijIybSv7jafstDKubGr1G5uTQXpI2w5B6P3X5gmzy1tJNZ7q7zmJ485LSYdLMgrmAjqb5AvmLuyLIYzQySQDikf0thq4yUnrAC65Uk8P3e/ZnZB/gOzHbOPaP7sll+X4gPaXBSYAs+UB30gKdqYj+8GI1X9kEyRiPr0Uuh2/sfrPOB/eYYbqpFoYu36RX/Cr73aJun1PuVErl2ceh+L+v3aSxP39UumtZgbEkZeVvVTR98CHhx+TGW9lzStEERefWZY6LJiHamKq+OwArigeWPaktGD0VnzPobZTyDFK/BxJ4bTYEj8SUlwKQt2+B897/fXr6o4+5LOx2wLkUFxWe9RYNl0oakxs+8FasFgL8HC2k4vI6WTvyJmljvIpch+nhiZLVjodSAkCmbyaf3PdEhsSMSVAqtLQ+fMvHC39ay2Fq5+30V7pgoz/199cjuQZIE8rAJTSZk= odl_user@SandboxHost-638723165943534098"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"