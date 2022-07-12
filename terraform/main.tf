
resource "azurerm_resource_group" "contoso_rg" {
  name     = "${var.prefix}_rg"
  location = var.region
  tags     = var.tags
}

