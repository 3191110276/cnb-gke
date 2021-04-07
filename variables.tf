
variable "apikey" {
  type    = string
}

variable "secretkey" {
  type    = string
}

variable "te_token" {
  type = string  
}

variable "zone" {
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
  type = string
}


variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "prod"
