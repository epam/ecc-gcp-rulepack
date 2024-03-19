data "google_compute_image" "this" {
  family  = var.family
  project = "debian-cloud"
}

resource "google_compute_instance" "this" {
  name                = module.naming.resource_prefix.instance
  machine_type        = "f1-micro"
  zone                = var.zone
  can_ip_forward      = false
  deletion_protection = false
  tags                = ["foo", "bar"]

  boot_disk {
    source      = data.terraform_remote_state.common.outputs.disk_name
    auto_delete = false
  }

  scheduling {
    preemptible         = false
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = google_service_account.this.email
    scopes = ["compute-rw"]
  }

  network_interface {
    network    = google_compute_network.this.id
    subnetwork = google_compute_subnetwork.this.self_link
  }

  shielded_instance_config {
    enable_vtpm                 = "true"
    enable_integrity_monitoring = "true"
  }

  metadata = {
    serial-port-enable     = "false"
    block-project-ssh-keys = "true"
    enable-oslogin         = "true"
    enable-oslogin-2fa     = true
  }
}

resource "google_compute_instance" "this2" {
  name                = "${module.naming.resource_prefix.instance}-2"
  machine_type        = "n2d-standard-2"
  zone                = var.zone
  deletion_protection = false

  confidential_instance_config {
    enable_confidential_compute = true
  }

  boot_disk {
    initialize_params {
      image = var.conf_image
    }
  }

  scheduling {
    preemptible         = true
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
  }

  network_interface {
    network    = google_compute_network.this.id
    subnetwork = google_compute_subnetwork.this.self_link
  }

}