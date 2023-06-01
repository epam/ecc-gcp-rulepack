resource "google_container_cluster" "this" {
  name               = var.cluster
  location           = var.region
  initial_node_count = var.node_count

  database_encryption {
    state    = "ENCRYPTED"
    key_name = google_kms_crypto_key.this.id
  }

  resource_labels = {
    custodianrule    = "ecc-gcp-132-kubernetes_cluster_application-layer_secrets_not_encrypted"
    compliancestatus = "green"
  }
}
