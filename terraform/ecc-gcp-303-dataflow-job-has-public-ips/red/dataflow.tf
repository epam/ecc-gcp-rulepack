resource "google_dataflow_job" "this" {
  name              = "dataflow-job-303-red"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://bucket-303-red/tmp_dir"
  ip_configuration  = "WORKER_IP_PUBLIC"

  parameters = {
    inputFile = "gs://bucket-303-red/text.txt"
    output    = "gs://bucket-303-red/"
  }

  depends_on = [
    google_storage_bucket.this
  ]
}
