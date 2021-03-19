terraform {
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.3.3"
    }
  }
}

provider "thousandeyes" {
  token = "var.te_token"
}