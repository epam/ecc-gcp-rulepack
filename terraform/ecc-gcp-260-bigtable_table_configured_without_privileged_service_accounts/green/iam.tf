resource "google_bigtable_table_iam_member" "this" {
  table    = google_bigtable_table.this.name
  instance = google_bigtable_instance.this.name
  role     = "roles/bigtable.reader"
  member   = "serviceAccount:${google_service_account.this.email}"
}

resource "google_service_account" "this" {
  account_id   = var.said
  display_name = var.saname
}
