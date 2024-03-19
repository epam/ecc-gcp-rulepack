resource "random_id" "this" {
  byte_length = 4
}

resource "google_apikeys_key" "this" {
  name = "${module.naming.resource_prefix.apikey}-${random_id.this.hex}"

  restrictions {
    server_key_restrictions {
      allowed_ips = ["8.8.8.8"]
    }
    api_targets {
      service = "translate.googleapis.com"
    }
  }
}