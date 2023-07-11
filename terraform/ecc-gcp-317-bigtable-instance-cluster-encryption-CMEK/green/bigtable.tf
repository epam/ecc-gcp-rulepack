resource "google_bigtable_instance" "this" {
  name                = "instance-${var.prefix}"
  deletion_protection = "false"

  cluster {
    cluster_id   = "instance-cluster-${var.prefix}"
    num_nodes    = 1
    storage_type = "HDD"
    zone         = var.zone
    kms_key_name = google_kms_crypto_key.this.id
  }

  labels = {
    custodiarule     = "ecc-gcp-317-bigtable-instance-cluster-encryption-cmek"
    compliancestatus = "green"
  }

  depends_on = [google_kms_crypto_key_iam_binding.this]
}
