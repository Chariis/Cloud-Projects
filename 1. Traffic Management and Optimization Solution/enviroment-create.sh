# Correcting group variable assignment
group="GladchekProject"

# Creating the resource group in North Europe
az group create -g "$group" -l northeurope

# Defining admin username and password
username=adminuser
password='SecretPassword123!@#'

# Creating the VM in North Europe
az vm create \
  -n vm-northeurope \
  -g "$group" \
  -l northeurope \
  --image Win2019Datacenter \
  --admin-username "$username" \
  --admin-password "$password" \
  --nsg-rule rdp

# Creating another VM in East US 2
az vm create \
  -n vm-eastus2 \
  -g "$group" \
  -l eastus2 \
  --image Win2019Datacenter \
  --admin-username "$username" \
  --admin-password "$password" \
  --nsg-rule rdp

# Creating the App Service Plan for East US 2
az appservice plan create \
  -n web-eastus2-plan \
  -g "$group" \
  -l eastus2 \
  --sku S1

# Using correct random number generation for app name
appname="Gladchek-eastus2-${RANDOM}${RANDOM}"

# Creating the Web App in East US 2
az webapp create \
  -n "$appname" \
  -g "$group" \
  -p web-eastus2-plan

# Creating the App Service Plan for North Europe
az appservice plan create \
  -n web-northeurope-plan \
  -g "$group" \
  -l northeurope \
  --sku S1

# Using correct random number generation for app name
appname="Gladchek-northeurope-${RANDOM}${RANDOM}"

# Creating the Web App in North Europe
az webapp create \
  -n "$appname" \
  -g "$group" \
  -p web-northeurope-plan

# Listing all web apps in Gladchek resource group
az webapp list -g "$group" --query "[].enabledHostNames" -o jsonc

# Listing all VMs
az vm list \
  -g "$group" -d \
  --query "[].{name:name,ip:publicIps,user:osProfile.adminUsername}" \
  -o jsonc
