resource "google_compute_disk" "this" {
  name  = var.disk_name
  size  = 10
  image = "debian-cloud/debian-10"
  type  = "pd-ssd"
  zone  = var.zone
  labels = {
    custodiarule     = "ecc-gcp-447-attached_disk"
    compliancestatus = "green"
  }
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    source = google_compute_disk.this.self_link
  }

  network_interface {
    network = var.network
  }

  labels = {
    custodianrule    = "ecc-gcp-447-attached_disk"
    compliancestatus = "green"
  }
}