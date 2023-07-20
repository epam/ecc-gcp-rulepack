resource "google_service_account" "this" {
  account_id   = var.serviceac
  display_name = var.dname
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}