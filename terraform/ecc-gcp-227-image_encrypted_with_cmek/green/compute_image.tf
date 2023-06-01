resource "google_compute_image" "this" {
  name = "compute-image-227-green"

  raw_disk {
    source = "https://storage.googleapis.com/bosh-gce-raw-stemcells/bosh-stemcell-97.98-google-kvm-ubuntu-xenial-go_agent-raw-1557960142.tar.gz"
  }

  image_encryption_key {
    kms_key_self_link = google_kms_crypto_key.this.id
  }

  labels = {
    custodianrule    = "ecc-gcp-227-image_encrypted_with_cmek"
    compliancestatus = "green"
  }
}
