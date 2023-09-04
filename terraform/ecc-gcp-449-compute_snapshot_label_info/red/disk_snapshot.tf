resource "google_compute_snapshot" "this" {
  name        = var.snapshot_name
  source_disk = google_compute_disk.this.name
  zone        = var.zone
}

resource "google_compute_disk" "this" {
  name = var.disk_name
  size = 10
  type = "pd-ssd"
  zone = var.zone
  labels = {
    custodiarule     = "ecc-gcp-449-compute_snapshot_label_info"
    compliancestatus = "red"
  }
}
