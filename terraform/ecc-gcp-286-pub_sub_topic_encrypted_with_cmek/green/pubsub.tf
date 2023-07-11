resource "google_pubsub_topic" "this" {
  name         = "topic-${var.prefix}"
  kms_key_name = google_kms_crypto_key.this.id

  depends_on = [google_kms_crypto_key_iam_binding.this]
}
