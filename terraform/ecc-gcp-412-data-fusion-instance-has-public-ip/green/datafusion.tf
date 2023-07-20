resource "google_data_fusion_instance" "this" {
  name             = "instance-412-green"
  region           = var.region
  type             = "DEVELOPER"
  private_instance = true

  network_config {
    network       = google_compute_network.this.name
    ip_allocation = "${google_compute_global_address.this.address}/${google_compute_global_address.this.prefix_length}"
  }

  labels = {
    custodiarule     = "ecc-gcp-412-data-fusion-instance-has-public-ip"
    compliancestatus = "green"
  }
}
