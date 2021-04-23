terraform {
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.4.1"
    }
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.0"
    }
  }
}

provider "thousandeyes" {
  token = var.te_token
}

provider "intersight" {
  apikey = var.is_api_key
  secretkey = var.secret_key
  endpoint = "intersight.com"
}