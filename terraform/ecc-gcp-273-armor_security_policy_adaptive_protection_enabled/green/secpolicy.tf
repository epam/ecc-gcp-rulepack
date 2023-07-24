resource "google_compute_security_policy" "this" {
  name = var.policyname
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
  adaptive_protection_config {
    layer_7_ddos_defense_config {
      enable = true
    }
  }
}
