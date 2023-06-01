resource "google_compute_disk" "this" {
  name  = var.name
  zone  = var.zone
  image = "debian-cloud/debian-10"

  labels = {
    custodiarule     = "ecc-gcp-039-vm_disks_encrypted_csek"
    compliancestatus = "red"
  }

}