resource "thousandeyes_page_load" "test2" {
  test_name = "website_pageload"
  
  alerts_enabled         = 0
  bandwidth_measurements = 0
  network_measurements   = 0

  content_regex = ".*"
  
  url      = var.test_page
  
  interval      = 300
  http_interval = 300
	
  agents {
      agent_id = 144 # Vienna
  }
  
  agents {
      agent_id = 58 # Cairo
  }
  
  agents {
      agent_id = 60411 # Paris (Azure)
  }
	
  agents {
      agent_id = 56289 # Paris (AWS)
  }
	
  agents {
      agent_id = 65163 # Tokyo
  }
}

# data "intersight_organization_organization" "test" {
#   name = "default"
# }

# resource "intersight_kubernetes_sys_config_policy" "test123" {

#   name = "test_k8s_sysconfig"

#   dns_servers = ["10.51.75.254"]

#   ntp_servers = ["10.51.75.240"]
#   timezone = "Europe/Vienna"

#   organization {
#     object_type = "organization.Organization"
#     moid        = data.intersight_organization_organization.test.moid
#   }
# }
