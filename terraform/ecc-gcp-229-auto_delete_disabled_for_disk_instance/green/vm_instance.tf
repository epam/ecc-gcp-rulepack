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

    auto_delete = false
  }
  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-229-auto_delete_disabled_for_disk_instance"
    compliancestatus = "green"
  }
}
