terraform {
  required_version = ">= 0.12.26"
}

module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.5"
  project_id   = var.project
  network_name = "kubernetes"
  subnets = [
    {
      subnet_name   = "subnet"
      subnet_ip     = "10.10.0.0/16"
      subnet_region = var.region
    },
   ]
  secondary_ranges = {
    "subnet" = [
      {
        range_name    = "pods"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "services"
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }
}

  
module "gke" {
  source                 = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id             = var.project
  name                   = "gke"
  regional               = true
  region                 = var.region
  network                = module.gcp-network.network_name
  subnetwork             = module.gcp-network.subnets_names[0]
  ip_range_pods          = "pods"
  ip_range_services      = "services"
  node_pools = [
    {
      name                      = "node-pool"
      machine_type              = "e2-medium"
      node_locations            = "europe-west3-a,europe-west3-b"
      min_count                 = 1
      max_count                 = 2
      disk_size_gb              = 30
    },
  ]
}

    
module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  depends_on   = [module.gke]
  project_id   = var.project
  location     = module.gke.location
  cluster_name = module.gke.name
}

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig-env_name"
}

module "cnb" {
  source  = "3191110276/cnb/kubernetes"
  version = "0.2.0"

  appd_browserapp_key       = module.order-app.eum_key
  appd_browserapp_beaconurl = "fra-col.eum-appdynamics.com"

  appd_account_name        = var.appD_account_name
  appd_controller_hostname = "ceer.saas.appdynamics.com"
  appd_controller_port     = "443"
  appd_controller_key      = var.appd_controller_key 

  deploy_order = true
  order_subcomponents_deployment = {
    nginx_ingress   = false
    orderfile       = true
    adminfile       = false
    apiserver       = true
    inventorydb     = false
    payment         = true
    orderprocessing = false
    orderqueue      = false
    notification    = false
    prodrequest     = false
    production      = false
    fulfilment      = false
  }

  deploy_trafficgen  = false
  deploy_extprod     = false
  deploy_extpayment  = false
  deploy_accounting  = false
  deploy_procurement = false
}  
  
module "appdynamics" {
  source  = "3191110276/appdynamics/kubernetes"
  version = "0.1.17"

  appd_account_name        = var.appD_account_name
  appd_global_account      = var.appd_global_account
  appd_controller_url      = "https://ceer.saas.appdynamics.com:443"
  appd_controller_hostname = "ceer.saas.appdynamics.com"
  appd_controller_key      = var.appd_controller_key 
  appd_username            = var.appd_username
  appd_password            = var.appd_password

  cluster_name = "gke"

  ns_to_monitor = ["accounting", "appdynamics", "automation", "default", "iks", "iwo", "kube-node-lease", "kube-public", "kube-system", "order", "procurement"]
 
}
  
  
