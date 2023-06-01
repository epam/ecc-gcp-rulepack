resource "random_id" "this" {
  byte_length = 4
}

resource "google_sql_database_instance" "this" {
  name                = "${var.dbname}-${random_id.this.hex}-234-red"
  database_version    = var.dbver
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.tier
    user_labels = {
      custodianrule    = "ecc-gcp-234-sql_encrypted_with_cmek"
      compliancestatus = "red"
    }
  }
}
