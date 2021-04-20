module "gke-cisco" {
  source              = "namjachingu/gke-cisco/google"
  version             = "0.1.10"
  apikey              = var.apikey
  secretkey           = var.secretkey
  te_token            = var.te_token
  project             = var.project
  location            = var.location
  region              = var.region
  appd_account_name   = var.appd_account_name
  appd_global_account = var.appd_global_account
  appd_controller_key = var.appd_controller_key
  appd_username       = var.appd_username
  appd_password       = var.appd_password
}
