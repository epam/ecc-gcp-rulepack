resource "google_bigquery_dataset" "this" {
  dataset_id = "dataset_${var.prefix}"
  location   = var.region

  labels = {
    custodianrule    = "ecc-gcp-456-bigquery_job_label_info"
    compliancestatus = "green"
  }
}

resource "google_bigquery_table" "this" {
  dataset_id          = google_bigquery_dataset.this.dataset_id
  table_id            = "table_${var.prefix}"
  deletion_protection = false

  labels = {
    custodianrule    = "ecc-gcp-456-bigquery_job_label_info"
    compliancestatus = "green"
  }

}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_bigquery_job" "this" {
  job_id = "job_${random_id.this.hex}_${var.prefix}"

  labels = {
    custodianrule    = "ecc-gcp-456-bigquery_job_label_info"
    compliancestatus = "green"
  }

  query {
    query = "SELECT /* do nothing */ 1;"

    destination_table {
      project_id = google_bigquery_table.this.project
      dataset_id = google_bigquery_table.this.dataset_id
      table_id   = google_bigquery_table.this.table_id
    }
  }
}
