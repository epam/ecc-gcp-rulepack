resource "google_apikeys_key" "this" {
  name         = var.key_name
  display_name = var.d_name

  restrictions {
    server_key_restrictions {
      allowed_ips = ["0.0.0.0"]
    }
  }
}
