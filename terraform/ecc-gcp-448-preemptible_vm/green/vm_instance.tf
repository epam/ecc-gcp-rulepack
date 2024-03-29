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

  network_interface {
    network = var.network
  }

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    instance_termination_action = "STOP"
    provisioning_model          = "SPOT"
  }

  labels = {
    custodianrule    = "ecc-gcp-448-preemptible_vm"
    compliancestatus = "green"
  }
}
