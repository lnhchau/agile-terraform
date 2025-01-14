# Azure subscription vars
subscription_id = "a3a536c2-3690-4c5f-8032-998a8dc3234e"
client_id = "90a17280-5e99-4097-8bdd-c01a1a629169"
client_secret = "Uoj8Q~Jvcybhsl5Fag4JY9qfMgIGVAWsFHwRpbdz"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"

# Reso urce Group/Location
location = "South Central US"
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
packer_image = "/subscriptions/a3a536c2-3690-4c5f-8032-998a8dc3234e/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# SSH key
public_key_path = "id_rsa.pub"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7SVkoUh63j6M7EwkMmVXtk7QAVPmSbNxUL3pPDlox+tkcJn5/wQGAzWxSQ+jUYsOhCx8uTs5BT7ddK/U4wgBsdSsKeo7oNB7XqEbpXag9NVeIlCDE2e35aGDdlAFkZWtVH52uikPYhi9ILBHksFeZ1YVCQswNyNjN7QYfuYhe+dEaJVUkwqHc8X/0BLNPd96S/UMk1IDSv9dHtL+SQaeao8fQkXCA4EUU1+9DwNxWZ12w+zxGVRGe1UP8/9JTb9FuDwrSBXdZHtXW1Vul+3ljvvdRs3PqpT3d4F5WQg9wYLaPCZPTsoCxZkJMjtv4i1PJeb+BRxnH8apfyI4YZ7SpjreSCnk2ZhneQFx8Y7b6WS4OcK/eHxIu6vuUwcU+ig9OqsdgBM5ze+fYByjY09+R3EZyvd2vzgdOWPIT8u6RmFd3dp1tp7xo74rbFfjQwZp6Gu6t/Ajq6kzxX071cIaF4xViAbR/mTGZmsCGxkB8ATM04eNgazSlxQyr5He/fQU= odl_user@SandboxHost-638724211402610631"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"