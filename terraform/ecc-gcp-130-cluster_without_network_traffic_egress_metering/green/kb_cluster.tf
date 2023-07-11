resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  resource_usage_export_config {

    bigquery_destination {
      dataset_id = var.dataset
    }

    enable_network_egress_metering = true
  }

  resource_labels = {
    custodiarule     = "ecc-gcp-130-cluster_without_network_traffic_egress_metering"
    compliancestatus = "green"
  }

}
