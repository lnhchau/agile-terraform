# Azure subscription vars
subscription_id = "a9ab978b-a5d4-42b1-a453-fe2690ceb40f"
client_id = "7a1d63a2-522c-4848-8fe2-aee02f012983"
client_secret = "6cZ8Q~Pl3IZJo3hCoIragW9yGWnwcO_isDnhNb.X"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"

# Reso urce Group/Location
location = "East US"
resource_group = "Azuredevops"
application_type = "myapp"

# Network
virtual_network_name = "myNetwork"
address_space = ["10.5.0.0/16"]
# address_prefixes = ["10.5.1.0/24"]
address_prefix_test = "10.5.1.0/24"

# VM
vm_size           = "Standard_B1s"
vm_admin_username = "chaulnh"
packer_image_name = "myPackerImage"
packer_image = "/subscriptions/a9ab978b-a5d4-42b1-a453-fe2690ceb40f/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# SSH key
public_key_path = "id_rsa.pub"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDd0EPDM/9A1o811mCfISjd0YjXBrp5W043OCYHDgoOeZr8GY3U0xuSOijIybSv7jafstDKubGr1G5uTQXpI2w5B6P3X5gmzy1tJNZ7q7zmJ485LSYdLMgrmAjqb5AvmLuyLIYzQySQDikf0thq4yUnrAC65Uk8P3e/ZnZB/gOzHbOPaP7sll+X4gPaXBSYAs+UB30gKdqYj+8GI1X9kEyRiPr0Uuh2/sfrPOB/eYYbqpFoYu36RX/Cr73aJun1PuVErl2ceh+L+v3aSxP39UumtZgbEkZeVvVTR98CHhx+TGW9lzStEERefWZY6LJiHamKq+OwArigeWPaktGD0VnzPobZTyDFK/BxJ4bTYEj8SUlwKQt2+B897/fXr6o4+5LOx2wLkUFxWe9RYNl0oakxs+8FasFgL8HC2k4vI6WTvyJmljvIpch+nhiZLVjodSAkCmbyaf3PdEhsSMSVAqtLQ+fMvHC39ay2Fq5+30V7pgoz/199cjuQZIE8rAJTSZk= odl_user@SandboxHost-638723165943534098"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"