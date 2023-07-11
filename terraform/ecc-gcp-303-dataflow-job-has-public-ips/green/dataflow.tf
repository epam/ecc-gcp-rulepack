resource "google_dataflow_job" "this" {
  name              = "dataflow-job-303-green"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://test-bucket-303-green/tmp_dir"
  ip_configuration  = "WORKER_IP_PRIVATE"

  parameters = {
    inputFile = "gs://test-bucket-303-green/text.txt"
    output    = "gs://test-bucket-303-green/"
  }

  depends_on = [
    google_storage_bucket.this
  ]
}
