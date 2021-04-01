

provider "google" {
  version = "~> 3.10.0"
  project     = var.project 
  region      = var.region
  zone        = var.zone
}


