resource "google_service_account" "this" {
  account_id   = var.serviceac
  display_name = var.dname
}

# note this requires the terraform to be run regularly
resource "time_rotating" "this" {
  rotation_days = 90
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.name

  keepers = {
    rotation_time = time_rotating.this.rotation_rfc3339
  }
}