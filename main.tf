resource "thousandeyes_page_load" "test2" {
  test_name = "google_pageload"
  
  alerts_enabled         = 0
  bandwidth_measurements = 0
  network_measurements   = 0

  content_regex = ".*"
  
  url      = "https://google.com"
  
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
