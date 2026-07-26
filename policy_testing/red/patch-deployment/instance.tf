data "google_compute_image" "this" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name           = "${module.naming.resource_prefix.instance}-patch"
  machine_type   = "e2-micro"
  zone           = "us-central1-a"
  can_ip_forward = false
  tags           = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }
}
