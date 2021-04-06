
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


variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "gke-cluster"
}

### Optional parameters ###
variable "cluster_service_account_name" {
  description = "The name of the custom service account used for the GKE cluster. This parameter is limited to a maximum of 28 characters."
  type        = string
  default     = "cluster-sa"
}

variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended."
  type        = string
  default     = "10.6.0.0/16"
}

variable "vpc_secondary_cidr_block" {
  description = "The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended."
  type        = string
  default     = "10.7.0.0/16"
}

variable "enable_vertical_pod_autoscaling" {
  description = "Enable vertical pod autoscaling"
  type        = string
  default     = true
}

variable "enable_workload_identity" {
  description = "Enable Workload Identity on the cluster"
  default     = true
  type        = bool
}

variable "override_default_node_pool_service_account" {
  description = "When true, this will use the service account that is created for use with the default node pool that comes with all GKE clusters"
  type        = bool
  default     = false
}
