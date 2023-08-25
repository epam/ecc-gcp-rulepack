data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name           = var.instance_name
  machine_type   = "f1-micro"
  zone           = var.zone
  can_ip_forward = false

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
      labels = {
        custodiarule     = "ecc-gcp-442-suspended_instances_for_more_than_a_week"
        compliancestatus = "green"
      }
    }
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodiarule     = "ecc-gcp-442-suspended_instances_for_more_than_a_week"
    compliancestatus = "green"
  }
}
