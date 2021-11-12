# Create AVD workspace
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace
# https://learn.hashicorp.com/tutorials/terraform/dependencies#manage-explicit-dependencies
resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace
  resource_group_name = var.rgname
  location            = var.location
  friendly_name       = "AVD Workspace"
  description         = "Workspace"
  depends_on          = [azurerm_resource_group.rg]
}

# Create AVD host pool
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  resource_group_name      = var.rgname
  location                 = var.location
  name                     = var.hostpool
  friendly_name            = var.hostpool
  validate_environment     = true
  custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;"
  description              = "Terraform HostPool"
  type                     = "Pooled"
  maximum_sessions_allowed = 16
  load_balancer_type       = "DepthFirst" #[BreadthFirst DepthFirst]
  depends_on               = [azurerm_resource_group.rg]
}

# Create AVD desktop application group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_application_group
resource "azurerm_virtual_desktop_application_group" "dag" {
  resource_group_name = var.rgname
  host_pool_id        = azurerm_virtual_desktop_host_pool.hostpool.id
  location            = var.location
  type                = "Desktop"
  name                = "avd-dag"
  friendly_name       = "Desktop AppGroup"
  description         = "AVD application group"
  depends_on          = [azurerm_virtual_desktop_host_pool.hostpool, azurerm_virtual_desktop_workspace.workspace]
}

# Associate Workspace and Desktop Application Group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace_application_group_association
resource "azurerm_virtual_desktop_workspace_application_group_association" "ws-dag" {
  application_group_id = azurerm_virtual_desktop_application_group.dag.id
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
}
