resource "google_compute_instance_template" "this" {
  name           = module.naming.resource_prefix.instance_template
  machine_type   = "f1-micro"
  can_ip_forward = true

  disk {
    source_image = data.google_compute_image.this.self_link
  }

  network_interface {
    network = data.google_compute_network.default.name
    access_config {
      network_tier = "PREMIUM"
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.this.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    serial-port-enable = "true"
    enable-oslogin     = "false"
  }
}