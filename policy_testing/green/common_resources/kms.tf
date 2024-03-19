locals {
  kms_ring_exist_bool_us = tonumber(data.external.common_us.result.kms_ring_exist_bool)
  kms_ring_exist_bool    = tonumber(data.external.common_us_central.result.kms_ring_exist_bool)
  kms_key_ring_name      = "${module.naming.resource_prefix.key_ring}-common"
}

data "external" "common_us" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "${local.kms_key_ring_name}-us", "${var.location}", "kms"]
}

data "external" "common_us_central" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "${local.kms_key_ring_name}", "${var.region}", "kms"]
}

resource "google_kms_key_ring" "common_us" {
  count    = local.kms_ring_exist_bool_us
  name     = "${local.kms_key_ring_name}-us"
  location = var.location
}

resource "google_kms_key_ring" "common_us_central" {
  count    = local.kms_ring_exist_bool
  name     = local.kms_key_ring_name
  location = var.region
}

resource "google_kms_crypto_key" "common_us" {
  name            = "keyname-${random_id.common.hex}-common-us"
  key_ring        = local.kms_ring_exist_bool_us == 0 ? "projects/${var.project}/locations/${var.location}/keyRings/${local.kms_key_ring_name}-us" : google_kms_key_ring.common_us[0].id
  rotation_period = "7776001s"
}

resource "google_kms_crypto_key" "common_us_central" {
  name            = "keyname-${random_id.common.hex}-common"
  key_ring        = local.kms_ring_exist_bool == 0 ? "projects/${var.project}/locations/${var.region}/keyRings/${local.kms_key_ring_name}" : google_kms_key_ring.common_us_central[0].id
  rotation_period = "7776001s"
}

# grant KMS Encrypter Decryptor permissions to the Google Storage Service
resource "google_kms_crypto_key_iam_binding" "common_us" {
  crypto_key_id = google_kms_crypto_key.common_us.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.common.number}@gs-project-accounts.iam.gserviceaccount.com",
    "serviceAccount:bq-${data.google_project.common.number}@bigquery-encryption.iam.gserviceaccount.com",
  ]
}

resource "google_kms_crypto_key_iam_binding" "common_us_central" {
  crypto_key_id = google_kms_crypto_key.common_us_central.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = [
    "serviceAccount:service-${data.google_project.common.number}@gcp-sa-secretmanager.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.common.number}@gcp-sa-pubsub.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.common.number}@gcp-sa-bigtable.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.common.number}@compute-system.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.common.number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.common.number}@gcp-sa-cloud-sql.iam.gserviceaccount.com",
  ]
}

data "google_project" "common" {}

output "crypto_key_id_us" {
  value = google_kms_crypto_key.common_us.id
}

output "crypto_key_id_us_central" {
  value = google_kms_crypto_key.common_us_central.id
}

output "project_number" {
  value = data.google_project.common.number
}