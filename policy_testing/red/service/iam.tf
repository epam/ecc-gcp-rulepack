resource "google_service_account" "this" {
  account_id = module.naming.resource_prefix.sa
}

resource "time_rotating" "this" {
  rotation_days = 90
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.name
  public_key_type    = "TYPE_X509_PEM_FILE"

  keepers = {
    rotation_time = time_rotating.this.rotation_rfc3339
  }
}