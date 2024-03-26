resource "google_compute_security_policy" "this" {
  name = module.naming.resource_prefix.armor
  rule {
    action   = "deny"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default"
  }
  rule {
    action   = "deny(403)"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["9.9.9.0/24"]
      }
    }
    description = "Deny access to IPs in 9.9.9.0/24"
  }
  rule {
    action   = "deny(403)"
    priority = "1"
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('cve-canary')"
      }
    }
  }
  rule {
    action   = "deny(403)"
    priority = "2"
    match {
      expr {
        expression = "int(request.headers['content-length']) >= 8192"
      }
    }
  }
  adaptive_protection_config {
    layer_7_ddos_defense_config {
      enable = true
    }
  }
}
