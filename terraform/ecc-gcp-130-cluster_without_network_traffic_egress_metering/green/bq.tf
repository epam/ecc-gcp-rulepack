resource "google_bigquery_dataset" "this" {
  dataset_id                  = var.dataset
  location                    = var.region
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true

  labels = {
    custodiarule     = "ecc-gcp-130-cluster_without_network_traffic_egress_metering"
    compliancestatus = "green"
  }
}
