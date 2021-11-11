# Create AVD Resource Group
resource "azurerm_resource_group" "rg" {
name     = avd-rg
location = eastus
}
