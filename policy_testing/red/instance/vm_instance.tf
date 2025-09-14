data "google_compute_default_service_account" "this" {}

data "google_compute_image" "this" {
  family  = var.family
  project = "debian-cloud"
}

data "google_compute_network" "default" {
  name = "default"
}

resource "google_compute_instance" "this" {
  name                = module.naming.resource_prefix.instance
  machine_type        = "f1-micro"
  zone                = var.zone
  can_ip_forward      = true
  deletion_protection = false

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  scheduling {
    preemptible         = true
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
  }

  service_account {
    email  = data.google_compute_default_service_account.this.email
    scopes = ["cloud-platform"]
  }

  network_interface {
    access_config {}
    network = data.google_compute_network.default.name
  }

  shielded_instance_config {
    enable_vtpm                 = "false"
    enable_integrity_monitoring = "false"
  }

  metadata = {
    serial-port-enable = "true"
  }
}

data "google_compute_image" "this2" {
  family  = "ubuntu-2004-lts-arm64"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "this2" {
  name                = "${module.naming.resource_prefix.instance}-2"
  machine_type        = "n2d-standard-2"
  zone                = var.zone
  deletion_protection = false

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this2.self_link
    }
  }

  scheduling {
    preemptible       = false
    automatic_restart = false
  }

  network_interface {
    network = data.google_compute_network.default.name
  }

}