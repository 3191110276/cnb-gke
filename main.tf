
module "google_container_cluster" "gke_cluster" {
  source = "terraform-google-modules/kubernetes-engine/google"
  name = "gke-cluster"

  project = var.project
  region = var.region
  zones = var.zones
  
  node_pool = var.node_pool
  initial_node_count = 1
}

resource "node_pool" {
  name = "gke-node-pool"
  machine_type = "e2-medium"
  provider = "google"
  cluster = "${google_container_cluster.gke_cluster.name}"
  node_count = 1
  #min_node_count
  #max_node_count
  
/* 
  management {
    auto_repair  = true
    auto_upgrade = true
  }
 */
  node_config {
    disk_size_gb = 10
    machine_type = "e2-medium"
    
    /* oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ] */
  }
}
