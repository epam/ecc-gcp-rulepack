resource "google_apikeys_key" "primary" {
  name         = "key-013-green"
  display_name = "key-013-green"
  project      = var.project

  restrictions {
    server_key_restrictions {
      allowed_ips = ["127.0.0.1"]
    }
  }
}