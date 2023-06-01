data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  scheduling {
    automatic_restart = true
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-230-automatic_restart_enabled_for_instance"
    compliancestatus = "green"
  }
}
