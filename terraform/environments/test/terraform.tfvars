# Azure subscription vars
# subscription_id = ""
# client_id = ""
# client_secret = ""
# tenant_id = ""

# Reso urce Group/Location
location = "South Central US"
resource_group = "Azuredevops"
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
packer_image = "/subscriptions/51003162-956a-4e6f-877b-3d0d913c7ca1/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# # Azure pipelines
public_key_path = "id_rsa.pub"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"