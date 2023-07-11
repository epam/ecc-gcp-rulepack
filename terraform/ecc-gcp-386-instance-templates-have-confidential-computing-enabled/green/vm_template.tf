resource "google_compute_instance_template" "this" {
  name         = var.template_name
  machine_type = var.machine_type

  disk {
    source_image = var.image
  }

  network_interface {
    network  = var.network
    nic_type = var.nic
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  confidential_instance_config {
    enable_confidential_compute = true
  }

  labels = {
    compliancestatus = "green"
  }
}
