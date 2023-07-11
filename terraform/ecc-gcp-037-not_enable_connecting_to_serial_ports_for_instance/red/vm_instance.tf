data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name         = "test"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  network_interface {
    network = var.network
  }
  metadata = {
    serial-port-enable = "true"
  }
}