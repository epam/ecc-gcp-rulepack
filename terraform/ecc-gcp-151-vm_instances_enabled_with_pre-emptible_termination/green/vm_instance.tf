data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = var.zone

  scheduling {
    preemptible = false
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-151-vm_instances_enabled_with_pre-emptible_termination"
    compliancestatus = "green"
  }
}
