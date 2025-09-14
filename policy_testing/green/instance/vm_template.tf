resource "google_compute_instance_template" "this" {
  name           = module.naming.resource_prefix.instance_template
  machine_type   = "n2d-standard-2"
  can_ip_forward = false

  disk {
    source_image = var.conf_image
  }

  network_interface {
    network    = google_compute_network.this.id
    subnetwork = google_compute_subnetwork.this.self_link
    nic_type   = "GVNIC"
  }

  service_account {
    email  = google_service_account.this.email
    scopes = ["compute-rw"]
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  shielded_instance_config {
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  confidential_instance_config {
    enable_confidential_compute = true
  }

  metadata = {
    serial-port-enable     = "false"
    enable-oslogin         = "true"
    block-project-ssh-keys = "true"
  }
}