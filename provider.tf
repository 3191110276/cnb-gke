

provider "google" {
  project = var.project
  region  = var.region
  }

provider "kubernetes" {
  source  = "hashicorp/kubernetes"
  version = ">= 2.0.1"
  }
