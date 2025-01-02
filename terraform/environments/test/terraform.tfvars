# Azure subscription vars
# subscription_id = ""
# client_id = ""
# client_secret = ""
# tenant_id = ""

# Resource Group/Location
location = "South Central US"
resource_group_name = "Azuredevops"
application_type = "myapp"
arm_access_key = ""

# Network
virtual_network_name = "vn-project-3"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM
admin_username = "chaulnh"
number_of_vms = 2
packer_image = "/subscriptions/157081ad-2288-4aa4-b6d0-69f2165b7326/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# Azure pipelines
public_key_path = "id_rsa.pub"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"