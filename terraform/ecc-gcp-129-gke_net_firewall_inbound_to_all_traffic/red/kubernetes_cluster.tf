resource "google_container_cluster" "this" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1
  network            = google_compute_network.this.self_link

  resource_labels = {
    custodiarule     = "ecc-gcp-129-gke_net_firewall_inbound_to_all_traffic"
    compliancestatus = "red"
  }
}

