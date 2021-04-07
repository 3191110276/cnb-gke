
variable "apikey" {
  type    = string
}

variable "secretkey" {
  type    = string
}

variable "te_token" {
  type = string  
}

variable "project" {
  description = "The project ID to host the cluster in."
  type = string
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
  default = "europe-west3-a"	
}

variable "region" {
  description = "The region to host the GKE cluster in."
  type = string
}
