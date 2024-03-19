locals {
  kms_ring_exist_bool = tonumber(data.external.script_to_check_kms_ring.result.kms_ring_exist_bool)
}

data "external" "script_to_check_kms_ring" {
  program = ["bash", "../../scripts/gcp_tf_scripts.sh", "${module.naming.resource_prefix.key_ring}", "${var.region}", "kms"]
}

resource "random_id" "this" {
  byte_length = 4
}

resource "google_kms_key_ring" "this" {
  count    = local.kms_ring_exist_bool
  name     = module.naming.resource_prefix.key_ring
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name     = "keyname-${random_id.this.hex}-test"
  key_ring = local.kms_ring_exist_bool == 0 ? "projects/${var.project}/locations/${var.region}/keyRings/${module.naming.resource_prefix.key_ring}" : google_kms_key_ring.this[0].id
}

resource "null_resource" "this" {
  triggers = {
    crypto_key_primary_name = google_kms_crypto_key.this.primary[0].name
    crypto_key_name         = google_kms_crypto_key.this.name
    key_ring_name           = module.naming.resource_prefix.key_ring
  }

  provisioner "local-exec" {
    command = join(" ", [
      "gcloud  kms keys versions disable ${self.triggers.crypto_key_primary_name}",
      "--key=${self.triggers.crypto_key_name}",
      "--location=${var.region}",
      "--keyring=${self.triggers.key_ring_name}"
      ]
    )
  }
}