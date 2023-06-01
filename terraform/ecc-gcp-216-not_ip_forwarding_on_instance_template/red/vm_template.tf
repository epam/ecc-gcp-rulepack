data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "this" {
  name           = var.template_name
  machine_type   = "f1-micro"
  can_ip_forward = true

  disk {
    source_image = data.google_compute_image.this.self_link
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-216-not_ip_forwarding_on_instance_template"
    compliancestatus = "red"
  }
}
