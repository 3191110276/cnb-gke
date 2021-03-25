data "thousandeyes_agent" "test_agent" {
  name  = "na-sjc-2-te [VS01]"
}

resource "thousandeyes_http_server" "google_http_test" {
  test_name = "google test"
  interval = 120
  url = "https://google.com"
  username = ""
  password = ""
  agents {
      agent_id = data.thousandeyes_agent.test_agent.agent_id
  }
  agents {

      agent_id = 12345
  }
}