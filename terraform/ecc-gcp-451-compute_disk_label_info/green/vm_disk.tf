resource "google_compute_disk" "this" {
  name  = var.name
  zone  = var.zone
  image = "debian-cloud/debian-10"

  labels = {
    custodiarule     = "ecc-gcp-451-compute_disk_label_info"
    compliancestatus = "green"
  }
}
