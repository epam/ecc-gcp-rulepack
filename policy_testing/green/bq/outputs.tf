output "bq" {
  value = {
    bq-dataset = google_bigquery_dataset.this.self_link
    bq-table   = google_bigquery_table.this.self_link
    bq-job     = google_bigquery_job.this.job_id
  }
}