# Azure subscription vars
# subscription_id = ""
# client_id = ""
# client_secret = ""
# tenant_id = ""

# Resource Group/Location
location = "West Europe"
resource_group_name = "Azuredevops"
application_type = "myApplication"

# Network
virtual_network_name = "vn-project-3"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
admin_username = "chaulnh"
number_of_vms = 2
packer_image = "\subscriptions\e2c7cd99-c3c5-4a90-9109-02e7d50f8311\resourceGroups\Azuredevops\providers\Microsoft.Compute\images\myPackerImage"

# Azure pipelines
#public_key_path = "id_rsa.pub"

# Local machine
public_key_path = "~/.ssh/id_rsa.pub"