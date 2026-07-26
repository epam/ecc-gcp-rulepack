resource "google_app_engine_firewall_rule" "this" {
  priority     = 2147483646
  action       = "ALLOW"
  source_range = "0.0.0.0/0"
  description  = "This rule denies access from any IPv4 address"
}