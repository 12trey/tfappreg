variable "name" {
  type = string
  description = "Application name"
}

variable "iduri" {
  type = string
  description = "This resources app id (TODO: figure out how to use self.id or use output of this to create identifier_uris)"
}

variable "owners" {
  type = list(string)
  description = "Application owners"
}

variable "reply_urls" {
  type = list(string)
  description = "Application allowed reply urls"
}

variable "logout_url" {
  type = string
  description = "Application reply urls"
}

terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = {
        source = "azurerm"
        version = "= 2.41.0"
    }
	azuread = {
        source = "azuread"
        version = "= 1.1.1"
    }
  }
}

provider "azurerm" {
    features {}
}

provider "azuread" {

}

#resource "azurerm_resource_group" "rg" {
#    name = "rg_tfresourcegroup02"
#    location = "eastus"
#}

resource "azuread_application" "spa" {
  name = var.name
  reply_urls = var.reply_urls
  #logout_url = var.logout_url
  owners = var.owners
  oauth2_allow_implicit_flow = false
  #identifier_uris = [ var.iduri ]
  #Add msgraph as required scope
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    #Add email, profile, and user.read (you can find these by manually creating them and looking at the app manifest)
    resource_access {
      id   = "64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0" #email appid
      type = "Scope"
    }
    resource_access {
      id   = "14dad69e-099b-42c9-810b-d002981feec1" #profile appid
      type = "Scope"
    }
    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" #user.read appid
      type = "Scope"
    }
  }
}

# resource "azuread_service_principal" "spa" {
#   application_id = azuread_application.spa.application_id
# }



# resource "azuread_application_password" "spa" {
#   application_object_id = azuread_application.spa.id
#   value                = "bd018069-622d-4b46-bcb9-2bbee49fe7d9"
#   end_date             = "2021-02-01T01:02:03Z"
# }