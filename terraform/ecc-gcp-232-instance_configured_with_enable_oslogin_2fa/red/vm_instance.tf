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

  network_interface {
    network = var.network
  }

  metadata = {
    enable-oslogin-2fa = false
  }

  labels = {
    custodianrule    = "ecc-gcp-232-instance_configured_with_enable_oslogin_2fa"
    compliancestatus = "red"
  }
}
