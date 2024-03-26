resource "google_data_fusion_instance" "this" {
  name                          = module.naming.resource_prefix.datafusion
  region                        = var.region
  type                          = "DEVELOPER"
  enable_stackdriver_logging    = true
  enable_stackdriver_monitoring = true
  private_instance              = true

  network_config {
    network       = google_compute_network.this.name
    ip_allocation = "${google_compute_global_address.this.address}/${google_compute_global_address.this.prefix_length}"
  }
}
