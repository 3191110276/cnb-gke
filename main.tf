module "gke-cisco" {
  source              = "namjachingu/gke-cisco/google"
  version             = "0.1.5"
  apikey              = var.apikey
  secretkey           = var.secretkey
  te_token            = var.te_token
  project             = var.project
  location            = var.location
  region              = var.region
 

}
