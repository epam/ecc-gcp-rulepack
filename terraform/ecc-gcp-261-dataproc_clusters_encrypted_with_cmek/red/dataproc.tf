resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-${var.prefix}"
  region = var.region

  cluster_config {
    gce_cluster_config {
      network = var.network
    }
  }

  depends_on = [
    google_compute_firewall.this
  ]

  labels = {
    custodiarule     = "ecc-gcp-261-dataproc_clusters_encrypted_with_cmek"
    compliancestatus = "red"
  }

}
