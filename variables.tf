# Intersight

variable "is_api_key" {
  type    = string
}
variable "is_secret_key" {
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

variable "test_page" {
  type    = string
  description = "website of the page that the test will be perfomed on"
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
