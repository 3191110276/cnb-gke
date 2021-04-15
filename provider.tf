

provider "google" {
  project = var.project
  region  = var.region
  }

#provider "kubernetes" {
#  source  = "hashicorp/kubernetes"
#  version = ">= 2.0.1"
#  }

provider "kubernetes" {
  load_config_file = "true"
  config_path = local_file.kubeconfig.filename
  cluster_ca_certificate = module.gke_auth.cluster_ca_certificate
  host                   = module.gke_auth.host
  token                  = module.gke_auth.token
  }
