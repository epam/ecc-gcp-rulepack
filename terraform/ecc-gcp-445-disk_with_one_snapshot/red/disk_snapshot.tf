resource "google_compute_snapshot" "this" {
  count       = 2
  name        = "${var.snapshot_name}${count.index}"
  source_disk = google_compute_disk.this.name
  zone        = var.zone
  labels = {
    custodiarule     = "ecc-gcp-445-disk_with_one_snapshot"
    compliancestatus = "red"
  }
}

resource "google_compute_disk" "this" {
  name = var.disk_name
  size = 10
  type = "pd-ssd"
  zone = var.zone
  labels = {
    custodiarule     = "ecc-gcp-445-disk_with_one_snapshot"
    compliancestatus = "red"
  }
}
