resource "google_bigtable_instance" "this" {
  name                = "instance-317-green"
  deletion_protection = "false"

  cluster {
    cluster_id   = "instance-cluster-317-green"
    num_nodes    = 1
    storage_type = "HDD"
    zone         = var.zone
    kms_key_name = google_kms_crypto_key.this.id
  }

  labels = {
    custodiarule     = "ecc-gcp-317-bigtable-instance-cluster-encryption-cmek"
    compliancestatus = "green"
  }
}
