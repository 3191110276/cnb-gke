data "intersight_organization_organization" "test" {
  name = "default"
}

resource "intersight_kubernetes_sys_config_policy" "test123" {

  name = "test_k8s_sysconfig"

  dns_servers = ["10.51.75.254"]

  ntp_servers = ["10.51.75.240"]
  timezone = "Europe/Vienna"

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.test.moid
  }
}

data "intersight_kubernetes_version" "version" {
  kubernetes_version = join("", ["v", var.k8s_version])
}

resource "intersight_kubernetes_version_policy" "k8s_version" {

  name = "test_k8s_version"
  
  depends_on = [intersight_kubernetes_sys_config_policy.test123]

  nr_version {
    object_type = "kubernetes.Version"
    moid        = data.intersight_kubernetes_version.version.moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.test.moid
  }
}
