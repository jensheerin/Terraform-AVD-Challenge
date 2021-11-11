# Create AVD Resource Group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "rg" {
name     = var.rgname
location = var.location
}
