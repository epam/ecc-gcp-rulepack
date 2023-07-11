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

  service_account {
    email  = google_service_account.this.email
    scopes = ["compute-ro", "monitoring"]
  }

  labels = {
    compliancestatus = "green"
  }

  depends_on = [
    google_service_account.this
  ]
}

resource "google_service_account" "this" {
  account_id   = var.sa_id
  display_name = "Service Account"
}
