resource "google_container_cluster" "this" {
  name               = "cluster-${var.prefix}"
  location           = var.region
  initial_node_count = 1

  database_encryption {
    state    = "ENCRYPTED"
    key_name = google_kms_crypto_key.this.id
  }

  resource_labels = {
    custodianrule    = "ecc-gcp-132-cluster_application-layer_secrets_not_encrypted"
    compliancestatus = "green"
  }

  depends_on = [google_kms_crypto_key_iam_binding.this]
}
