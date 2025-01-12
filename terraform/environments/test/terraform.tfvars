# Azure subscription vars
subscription_id = "51003162-956a-4e6f-877b-3d0d913c7ca1"
client_id = "ac4e1af1-8820-40c7-8e09-2b36a530c864"
client_secret = "X9D8Q~O13zSboW4E6w7sxKEKARf72q0vSMh6rdhc"
tenant_id = "f958e84a-92b8-439f-a62d-4f45996b6d07"

# Reso urce Group/Location
location = "South Central US"
resource_group = "Azuredevops"
application_type = "myapp"
arm_access_key = "ziNkXBt2N3YDvfLQQvg/Fh9RV/Q1XMU3z9ihPqW5lrAZowua52rcBkuPgcPwerkDF7QYed9p1qiW+AStT3exlg=="

# Network
virtual_network_name = "myNetwork"
address_space = ["10.5.0.0/16"]
address_prefixes = ["10.5.1.0/24"]
address_prefix_test = "10.5.1.0/24"


# VM
admin_username = "chaulnh"
admin_password = "password@123456"
# number_of_vms = 2
packer_image = "/subscriptions/51003162-956a-4e6f-877b-3d0d913c7ca1/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"

# SSH key
public_key_path = "/home/vsts/work/_temp/id_rsa.pub"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsbWyiVqrOgUpwumvpg7F2kBDZ/9d0/rq6nzw0PJkxzKWshJlOmjjsZIeXfU82yEvHSPxiPyfnZ25tyZRS9ycg3YK5yHcb+UR1oqfgfxbJ7SJQhOham8phKalsnkdlqdlraeeaTrl7BpOmTVY9R+VBo36eaSb33vuVAiBEXXzTGca51AHTkQcJ6jXx77sS26jW6Uv4a1pApszToV6RiqMnYEP6W+NyWrwJt7UH3PTLREyONAY0Homxws57ntUmmsVe1VWcnS0n06MwP39NgIDIkBQ4XxyTube6AsbGRVmvNHs+lPjcPG25f2uYkK/JDhsVpVwKZYpkjDDxVL0HWM0JzBId5xl77YSk54l/cpz1u/RgTYx6nxIZCgE1J2dEIE+xn/EPjnjg/PdGw6Cj7+V5PZ8eL+geQmoHJ+SnI5Mx2bX3BYqYk/pbSR4fgVPna3e/QE1+0BH1MdjwJHolKTD44IJmhUwyn/aw7L9ZiunUJzQW5mQ7jcb7QTDNfs+8K50= odl_user@SandboxHost-638722924966412207"

# Local machine
# public_key_path = "~/.ssh/id_rsa.pub"