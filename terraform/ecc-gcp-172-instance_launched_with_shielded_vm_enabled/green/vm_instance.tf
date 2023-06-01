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

  shielded_instance_config {
    enable_vtpm                 = "true"
    enable_integrity_monitoring = "true"
  }

  labels = {
    custodianrule    = "ecc-gcp-172-instance_launched_with_shielded_vm_enabled"
    compliancestatus = "green"
  }
}
