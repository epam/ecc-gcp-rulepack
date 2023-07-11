resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  provider            = google-beta
  name                = "${var.dbname}-${random_id.this.hex}-${var.prefix}"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false
  encryption_key_name = google_kms_crypto_key.this.id

  settings {
    tier = var.tier
    user_labels = {
      custodianrule    = "ecc-gcp-234-sql_encrypted_with_cmek"
      compliancestatus = "green"
    }
  }

  depends_on = [google_kms_crypto_key_iam_binding.this]
}
