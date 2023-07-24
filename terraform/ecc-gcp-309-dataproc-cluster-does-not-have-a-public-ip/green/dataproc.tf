resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-309-green"
  region = var.region

  cluster_config {
    gce_cluster_config {
      internal_ip_only = true
      network          = var.network
    }
  }

  labels = {
    custodiarule     = "ecc-gcp-309-dataproc-cluster-does-not-have-a-public-ip"
    compliancestatus = "green"
  }

  depends_on = [
    google_compute_firewall.this
  ]
}
