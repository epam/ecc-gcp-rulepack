resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-${var.prefix}"
  region = var.region

  labels = {
    custodiarule     = "ecc-gcp-261-dataproc_clusters_encrypted_with_cmek"
    compliancestatus = "green"
  }

  cluster_config {
    encryption_config {
      kms_key_name = google_kms_crypto_key.this.id
    }
    gce_cluster_config {
      network = var.network
    }
  }

  depends_on = [
    google_compute_firewall.this,
    google_kms_crypto_key_iam_binding.this
  ]
}
