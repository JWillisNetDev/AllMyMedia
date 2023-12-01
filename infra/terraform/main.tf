data "azurerm_resource_group" "allmymedia_rg" {
  name = "all-my-media-rg"
}

resource "azurerm_resource_group" "test_rg" {
  name     = "all-my-media-test-rg"
  location = "West US 3"
}