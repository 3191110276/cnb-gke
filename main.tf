data "intersight_organization_organization" "organization" {
  name = "default"
}

resource "intersight_kubernetes_sys_config_policy" "test123" {

  name = "test_k8s_sysconfig"

  dns_servers = ["10.51.75.254"]

  ntp_servers = ["10.51.75.254"]
  timezone = "Europe/Vienna"

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.moid
  }
}
