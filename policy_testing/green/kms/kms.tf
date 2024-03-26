locals {
  kms_ring_exist_bool = tonumber(data.external.script_to_check_kms_ring.result.kms_ring_exist_bool)
}

data "external" "script_to_check_kms_ring" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "${module.naming.resource_prefix.key_ring}", "${var.region}", "kms"]
}

resource "google_kms_key_ring" "this" {
  count    = local.kms_ring_exist_bool
  name     = module.naming.resource_prefix.key_ring
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name            = "keyname-${random_id.this.hex}-test"
  key_ring        = local.kms_ring_exist_bool == 0 ? "projects/${var.project}/locations/${var.region}/keyRings/${module.naming.resource_prefix.key_ring}" : google_kms_key_ring.this[0].id
  rotation_period = "7776001s"
}

resource "random_id" "this" {
  byte_length = 4
}