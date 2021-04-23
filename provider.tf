terraform {
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