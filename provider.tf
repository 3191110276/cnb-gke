

provider "google" {
  version = "~> 3.62.0"
  project     = var.project 
  region      = var.region
  zone        = var.zone
}


