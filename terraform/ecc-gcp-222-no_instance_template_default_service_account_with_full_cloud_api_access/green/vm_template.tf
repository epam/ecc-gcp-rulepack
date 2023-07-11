data "google_compute_default_service_account" "this" {}

data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "this" {
  name         = var.template_name
  machine_type = "f1-micro"

  disk {
    source_image = data.google_compute_image.this.self_link
  }

  service_account {
    email  = data.google_compute_default_service_account.this.email
    scopes = ["compute-rw"]
  }

  network_interface {
    network = var.network
  }

}