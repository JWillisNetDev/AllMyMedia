terraform {
  backend "azurerm" {
    resource_group_name  = "all-my-media-rg"
    storage_account_name = "allmymediainfrasa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }

  required_version = "~> 1.6.5"
}
