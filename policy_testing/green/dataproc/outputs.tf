output "dataproc" {
  value = {
    dataproc-clusters = google_dataproc_cluster.this.name
  }
}