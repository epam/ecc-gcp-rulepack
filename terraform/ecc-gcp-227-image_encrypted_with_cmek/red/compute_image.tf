resource "google_compute_image" "this" {
  name = "compute-image-227-red"

  raw_disk {
    source = "https://storage.googleapis.com/bosh-gce-raw-stemcells/bosh-stemcell-97.98-google-kvm-ubuntu-xenial-go_agent-raw-1557960142.tar.gz"
  }

  labels = {
    custodianrule    = "ecc-gcp-227-image_encrypted_with_cmek"
    compliancestatus = "red"
  }
}
