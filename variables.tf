variable "apikey" {
  type    = string
}

variable "secretkey" {
  type    = string
}

variable "k8s_version" {
  type    = string
  default = "1.18.12"
}

variable "project" {
  description = "The project ID to host the cluster in."
  type = string
}

variable "region" {
  type = string
  #default = "europe-west3"
}

variable "GOOGLE_CREDENTIALS" {
  description = "This authenticates the google provider."
type = string
}

variables "zone" {
  type = string
}
