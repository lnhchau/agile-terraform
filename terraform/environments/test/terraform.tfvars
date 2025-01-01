# Azure subscription vars
# subscription_id = ""
# client_id = ""
# client_secret = ""
# tenant_id = ""

# Resource Group/Location
location = "East US"
resource_group_name = "Azuredevops"
application_type = "Azuredevops-app"

# Network
virtual_network_name = "vn-project-3"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
admin_username = "chaulnh"
number_of_vms = 2
packer_image = "/subscriptions/83316a40-5757-40fd-8e78-645eefac51b6/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# Azure pipelines
#public_key_path = "id_rsa.pub"

# Local machine
public_key_path = "~/.ssh/id_rsa.pub"