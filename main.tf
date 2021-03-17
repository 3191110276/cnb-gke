data "thousandeyes_agent" "test_agent" {
  name  = "this-is-a-random-test"
}

resource "thousandeyes_http_server" "heroku-test" {
  name = "heroku test"
  interval = 120
  url = "https://heroku.com"
  agents {
      agent_id = data.thousandeyes_agent.test_agent.agent_id
  }
  agents {

      agent_id = 12345
  }
}
