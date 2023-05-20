# agent-server test
terraform {
  required_providers {
    thousandeyes = {
      source  = "thousandeyes/thousandeyes"
      version = "1.3.1"
    }
  }

provider "thousandeyes" {
  token            = var.api_token # use this variable from .tfvars
  account_group_id = var.account_group_id # use this variable from .tfvars
}

data "thousandeyes_agent" "EA_on_c9300" {
  agent_name = "shownet2023-c9300"
}

data "thousandeyes_agent" "EA_on_virtual_appliance" {
  agent_name = "shownet2023-virtual-appliance"
}

resource "thousandeyes_agent_to_server" "agent_to_server1" {
  for_each             = { for test in var.agent_to_server_test_targets : test.name => test }
  test_name            = each.value.name
  interval             = each.value.interval
  path_trace_mode      = each.value.path_trace_mode
  server               = each.value.server
  network_measurements = each.value.network_measurements

  agents {
    agent_id = data.thousandeyes_agent.EA_on_c9300.agent_id
  }
  agents {
    agent_id = data.thousandeyes_agent.EA_on_virtual_appliance.agent_id
  }
}
