variable "agent_to_server_test_targets" {
  type = list(object({
    name                 = string
    server               = string
    port                 = number
    interval             = number
    path_trace_mode      = string # optional 
    network_measurements = bool
  }))

  default = [
    { name = "AgentToServerTest(cisco.com)", server = "www.cisco.com", port = 443, interval = 300, path_trace_mode = "inSession", network_measurements = true },
    { name = "AgentToServerTest(interop.jp)", server = "www.interop.jp", port = 443, interval = 60, path_trace_mode = "inSession", network_measurements = true },
    { name = "AgentToServerTest(Grafana)", server = "10.71.147.88", port = 80, interval = 60, path_trace_mode = "inSession", network_measurements = true },
  ]
  description = "The list of Targets for Aget to Server Test"
}


variable "api_token" {
  type        = string
  default     = "" # tfvarsで上書き
  description = "API Token"
}

variable "account_group_id" {
  type        = string
  default     = "" # tfvarsで上書き
  description = "Interop Tokyo 2023 Account Grouop ID"
}
