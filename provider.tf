terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.0"
    }
  }
}

provider "intersight" {
  apikey = var.apikey
  secretkey = var.secretkey
  endpoint = "intersight.com"
}

provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project     = var.project 
  region      = var.region
  zone        = var.zone
}
