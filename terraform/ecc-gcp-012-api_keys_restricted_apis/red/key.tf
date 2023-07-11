resource "google_apikeys_key" "this" {
  name         = var.key_name
  display_name = var.d_name

  restrictions {
    api_targets {
      service = "cloudapis.googleapis.com"
    }
  }
}
