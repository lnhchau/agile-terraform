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
packer_image = "/subscriptions/67bd0a2e-3527-452d-b5c9-168d529053f6/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# Azure pipelines
public_key_path = "id_rsa.pub"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"