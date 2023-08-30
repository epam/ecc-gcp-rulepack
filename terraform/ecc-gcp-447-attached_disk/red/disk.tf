resource "google_compute_disk" "this" {
  name  = var.disk_name
  size  = 10
  image = "debian-cloud/debian-10"
  type  = "pd-ssd"
  zone  = var.zone
  labels = {
    custodiarule     = "ecc-gcp-447-attached_disk"
    compliancestatus = "red"
  }
}