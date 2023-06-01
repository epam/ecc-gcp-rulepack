data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  scheduling {
    on_host_maintenance = "MIGRATE"
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
    custodianrule    = "ecc-gcp-228-on_host_maintenance_set_to_migrate_for_instance"
    compliancestatus = "green"
  }
}
