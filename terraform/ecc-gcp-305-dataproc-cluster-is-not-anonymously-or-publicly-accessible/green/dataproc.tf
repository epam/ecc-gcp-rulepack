resource "google_dataproc_cluster" "this" {
  name   = "dataproc-cluster-305-green"
  region = var.region

  cluster_config {
    gce_cluster_config {
      network = var.network
    }
  }

  depends_on = [
    google_compute_firewall.this
  ]

}

resource "google_dataproc_cluster_iam_binding" "this" {
  cluster = google_dataproc_cluster.this.name
  role    = "roles/dataproc.viewer"

  members = [
    "group:test@test.com",
  ]
}