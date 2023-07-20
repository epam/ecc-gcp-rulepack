data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "this" {
  name         = var.template_name
  machine_type = var.machine_type

  disk {
    source_image = data.google_compute_image.this.self_link
  }

  network_interface {
    network = var.network
  }

  labels = {
    compliancestatus = "red"
  }
}
