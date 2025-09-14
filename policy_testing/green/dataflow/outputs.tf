output "dataflow" {
  value = {
    dataflow-job = google_dataflow_job.this.id
  }
}