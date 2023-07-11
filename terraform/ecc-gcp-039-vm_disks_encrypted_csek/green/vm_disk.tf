resource "google_compute_disk" "this" {
  name  = var.name
  zone  = var.zone
  image = "debian-cloud/debian-10"

  disk_encryption_key {
    raw_key = var.disk_key
  }

  labels = {
    custodiarule     = "ecc-gcp-039-vm_disks_encrypted_csek"
    compliancestatus = "green"
  }

}
