# Azure subscription vars
# subscription_id = ""
# client_id = ""
# client_secret = ""
# tenant_id = ""

# Resource Group/Location
location = "East US"
resource_group = "NetworkWatcherRG"
application_type = "myapp"
arm_access_key = ""

# Network
virtual_network_name = "vn-project-3"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
admin_username = "chaulnh"
admin_password = "password@123456"
number_of_vms = 2
packer_image = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# # Azure pipelines
public_key_path = "id_rsa.pub"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"