resource "google_compute_image" "this" {
  name = module.naming.resource_prefix.image

  raw_disk {
    source = "https://storage.googleapis.com/bosh-gce-raw-stemcells/bosh-stemcell-97.98-google-kvm-ubuntu-xenial-go_agent-raw-1557960142.tar.gz"
  }
}

resource "google_compute_image_iam_member" "this" {
  project = google_compute_image.this.project
  image   = google_compute_image.this.name
  role    = "roles/compute.imageUser"
  member  = "allAuthenticatedUsers"
}
