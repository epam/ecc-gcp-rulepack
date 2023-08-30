resource "random_id" "this" {
  byte_length = 4
}

data "google_kms_key_ring" "this" {
  name     = "keyring-${var.prefix}"
  location = var.region
}

resource "google_kms_key_ring" "this" {
  count    = data.google_kms_key_ring.this.id != null ? 0 : 1
  name     = "keyring-${var.prefix}"
  location = var.region
}

resource "google_kms_crypto_key" "this" {
  name            = "keyname-${random_id.this.hex}-${var.prefix}"
  key_ring        = data.google_kms_key_ring.this.id != null ? data.google_kms_key_ring.this.id : google_kms_key_ring.this[0].id
  rotation_period = "7776001s"

  labels = {
    custodiarule     = "ecc-gcp-443-enabled_kms_primary_key_version"
    compliancestatus = "red"
  }
}


resource "null_resource" "this" {
  provisioner "local-exec" {
    when = create
    command = join(" ", [
      "gcloud kms keys versions disable 1",
      "--location=${var.region}",
      "--keyring=keyring-${var.prefix}",
      "--key=keyname-${random_id.this.hex}-${var.prefix}"
      ]
    )
  }
  depends_on = [google_kms_crypto_key.this]
}
