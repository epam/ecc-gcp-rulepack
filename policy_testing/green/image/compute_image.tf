resource "google_compute_image" "this" {
  name = module.naming.resource_prefix.image

  raw_disk {
    source = "https://storage.googleapis.com/bosh-gce-raw-stemcells/bosh-stemcell-97.98-google-kvm-ubuntu-xenial-go_agent-raw-1557960142.tar.gz"
  }

  image_encryption_key {
    kms_key_self_link = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
  }
}

resource "google_compute_image_iam_member" "this" {
  project = google_compute_image.this.project
  image   = google_compute_image.this.name
  role    = "roles/compute.imageUser"
  member  = "serviceAccount:${google_service_account.this.email}"
}

resource "google_service_account" "this" {
  account_id = "${module.naming.resource_prefix.sa}-image"
}