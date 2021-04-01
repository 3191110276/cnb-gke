terraform {
  required_version = ">= 0.12.26"
}

module "google_container_cluster" {
  source = "github.com/gruntwork-io/terraform-google-gke.git//modules/gke-cluster?ref=v0.2.0"
  name = var.cluster_name

  project = var.project
  location = var.location

  network = module.vpc_network.network

  subnetwork                      = module.vpc_network.public_subnetwork
  cluster_secondary_range_name    = module.vpc_network.public_subnetwork_secondary_range_name
    
  alternative_default_service_account = var.override_default_node_pool_service_account ? module.gke_service_account.email : null

    
  enable_vertical_pod_autoscaling = var.enable_vertical_pod_autoscaling
  enable_workload_identity        = var.enable_workload_identity
  
}

resource "node_pool" "gke-node-pool" {
  provider = google-beta
  name = "gke-node-pool"
  region = var.region
  cluster = module.google_container_cluster.name

  initial_node_count = 1

  autoscaling {
    min_node_count = 3
    max_node_count = 1
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }


  node_config {
    image_type = "COS"
    machine_type = "e2-micro"    

    labels = {
      all-pools-example = true
    }
    
    tags = [
      module.vpc_network.public,
      "public-pool-example",
    ]


    disk_size_gb = 10
    disk-type = "pd-standard" #backed by standard HDD
    preemptible = false

   
    service_account = module.google_service_account.default.email

    workload_metadata_config {
      node_metadata = "GKE_METADATA_SERVER"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  } 

  lifecycle {
    ignore_changes = [initial_node_count]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}



### Creating a costum service account to use with the GKE cluster ###

module "gke_service_account" {
  source = "github.com/gruntwork-io/terraform-google-gke.git//modules/gke-cluster?ref=v0.2.0"
  
  name        = var.cluster_service_account_name
  project     = var.project
  description = var.cluster_service_account_description
}

#Creating a network to deploy the cluster to

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

module "vpc_network" {
  source = "github.com/gruntwork-io/terraform-google-network.git//modules/vpc-network?ref=v0.6.0"

  name_prefix = "${var.cluster_name}-network-${random_string.suffix.result}"
  project     = var.project
  region      = var.region

  cidr_block           = var.vpc_cidr_block
  secondary_cidr_block = var.vpc_secondary_cidr_block
}
