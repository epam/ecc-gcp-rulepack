resource "google_dataflow_job" "this" {
  name              = module.naming.resource_prefix.dataflow_job
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://${google_storage_bucket.this.name}/tmp_dir"

  parameters = {
    inputFile = "gs://${google_storage_bucket.this.name}/text.txt"
    output    = "gs://${google_storage_bucket.this.name}/"
  }
}
