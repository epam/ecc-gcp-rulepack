data "google_compute_image" "this" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "this" {
  name         = var.template_name
  machine_type = var.machine_type

  disk {
    source_image = data.google_compute_image.this.self_link

    labels = {
      custodianrule    = "ecc-gcp-446-compute_instance_template_label_info"
      compliancestatus = "green"
    }
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-446-compute_instance_template_label_info"
    compliancestatus = "green"
  }
}
