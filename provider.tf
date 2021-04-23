terraform {
  required_version = ">= 0.13"
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.4.1"
    }
  }
}

provider "thousandeyes" {
  token = var.te_token
}

provider "intersight" {
  apikey = var.api_key
  secretkey = var.secret_key
  endpoint = "intersight.com"
}