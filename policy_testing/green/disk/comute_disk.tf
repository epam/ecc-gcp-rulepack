resource "google_compute_disk" "this" {
  name  = module.naming.resource_prefix.disk
  zone  = var.zone
  type  = "pd-ssd"
  size  = 10
  image = "debian-cloud/${var.family}"

  disk_encryption_key {
    raw_key = random_id.this.b64_std
  }

}

resource "random_id" "this" {
  byte_length = 32
}

resource "google_compute_instance" "this" {
  name         = module.naming.resource_prefix.instance
  machine_type = "f1-micro"
  zone         = var.zone

  boot_disk {
    source                  = google_compute_disk.this.self_link
    disk_encryption_key_raw = random_id.this.b64_std
  }

  network_interface {
    network = "default"
  }
}