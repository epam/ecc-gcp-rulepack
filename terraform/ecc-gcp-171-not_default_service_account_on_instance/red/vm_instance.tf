data "google_compute_default_service_account" "this" {}

data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.this.email
    scopes = ["cloud-platform"]
  }
  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-171-not_default_service_account_on_instance"
    compliancestatus = "red"
  }
}
