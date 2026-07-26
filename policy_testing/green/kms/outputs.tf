output "kms" {
  value = {
    kms-cryptokey = google_kms_crypto_key.this.id
    kms-location  = google_kms_crypto_key.this.id
  }
}