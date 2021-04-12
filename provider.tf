terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.0"
    }
  }
}

provider "intersight" {
  apikey = var.api_key
  secretkey = var.secret_key
  endpoint = "intersight.com"
}

module "appdynamics" {
  source  = "3191110276/appdynamics/kubernetes"
  version = "0.1.5"
  appd_account_name = var.appd_account_name
  appd_controller_hostname = ""
  appd_controller_key = ""
  appd_controller_url = "https://ceer.saas.appdynamics.com/controller/"
  appd_global_account = ""
  appd_password = var.appd_pw
  appd_username = var.appd_un
  cluster_name = "default"
  db_hostname = ""
  db_name = ""
  db_password = ""
  db_port = ""
  db_type = ""
  db_username = ""
}