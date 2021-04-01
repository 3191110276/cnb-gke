

provider "google" {
  version = "3.43.0"
  project = var.project
  region  = var.region
}

provider "google-beta" {
  version = "3.43.0"
  project = var.project
  region  = var.region
}
