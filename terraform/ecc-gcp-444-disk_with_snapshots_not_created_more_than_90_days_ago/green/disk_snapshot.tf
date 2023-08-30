resource "google_compute_snapshot" "this" {
  name        = var.snapshot_name
  source_disk = google_compute_disk.this.name
  zone        = var.zone
  labels = {
    custodiarule     = "ecc-gcp-444-disk_with_snapshots_not_created_more_than_90_days_ago"
    compliancestatus = "green"
  }
}

resource "google_compute_disk" "this" {
  name = var.disk_name
  size = 10
  type = "pd-ssd"
  zone = var.zone
  labels = {
    custodiarule     = "ecc-gcp-444-disk_with_snapshots_not_created_more_than_90_days_ago"
    compliancestatus = "green"
  }
}