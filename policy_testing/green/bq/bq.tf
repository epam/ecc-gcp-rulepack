resource "google_bigquery_dataset" "this" {
  dataset_id = replace("${module.naming.resource_prefix.bq_dataset}", "-", "_")

  default_encryption_configuration {
    kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us
  }
}

resource "google_bigquery_table" "this" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = replace("${module.naming.resource_prefix.bq_table}", "-", "_")
  deletion_protection = false

  encryption_configuration {
    kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us
  }

}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_bigquery_job" "this" {
  job_id = replace("${module.naming.resource_prefix.bq_job}_${random_id.this.hex}", "-", "_")

  query {
    query = "SELECT /* do nothing */ 1;"

    destination_table {
      project_id = google_bigquery_table.this.project
      dataset_id = google_bigquery_table.this.dataset_id
      table_id   = google_bigquery_table.this.table_id
    }
  }

  depends_on = [random_id.this]
}