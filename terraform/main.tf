provider "azurerm" {
  features {}  
}
 
# Create Resource Group
resource "azurerm_resource_group" "contoso_rg" {
  name     = var.rg_name 
  location = var.region
}
 
#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "contoso-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.contoso_rg.name
}
 
# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.contoso_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.0.0/24"]
}
