terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.0"
    }
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.3.3"
    }
  }
}

provider "intersight" {
  apikey = var.apikey
  secretkey = var.secretkey
  endpoint = "intersight.com"
}

provider "google" {
  project     = var.project 
  region      = var.region
}

provider "thousandeyes" {
  te_token = "var.te_token"
}