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