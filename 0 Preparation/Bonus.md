Azure CLI commands:

`
az account show --query "{subscriptionId:id, tenantId:tenantId}"
az account set --subscription="${SUBSCRIPTION_ID}" 
az ad sp create-for-rbac --query '{"client_id": appId, "secret": password, "tenant": tenant}’
`

or Terraform

`
provider "azurerm" {  
  subscription_id = "<subscription id>"  
  client_id       = "<service principal app id>"
  client_secret   = "<service principal password>"
  tenant_id       = "<service principal tenant id>"
}
`
