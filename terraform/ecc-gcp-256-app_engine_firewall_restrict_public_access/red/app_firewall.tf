resource "google_app_engine_firewall_rule" "rule1" {
  priority     = 1
  action       = "ALLOW"
  source_range = "0.0.0.0/0"
  description  = "This rule allows access from any IPv4 address"
}

resource "google_app_engine_firewall_rule" "rule2" {
  priority     = 2
  action       = "ALLOW"
  source_range = "0.0.0.0"
  description  = "This rule allows access from all Compute Engine instances with Private Google Access enabled, not only the ones you own."
}

resource "google_app_engine_firewall_rule" "rule3" {
  priority     = 3
  action       = "ALLOW"
  source_range = "*"
  description  = "This rule allows access from any IP address"
}

resource "google_app_engine_firewall_rule" "rule4" {
  priority     = 4
  action       = "ALLOW"
  source_range = "::/0"
  description  = "This rule allows access from any IPv6 address"
}