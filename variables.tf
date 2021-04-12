# Intersight

variable "api_key" {
  type    = string
}
variable "secret_key" {
  type    = string
}

variable "k8s_version" {
  type    = string
  default = "1.18.12"
}

# ThousandEyes
variable "te_token" {
  type    = string
}

# AppD 
variable "appd_account_name" {
  type    = string
}

variable "appd_pw" {
  type    = string
}

variable "appd_un" {
  type    = string
}