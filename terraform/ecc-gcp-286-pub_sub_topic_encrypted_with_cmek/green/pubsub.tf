resource "google_pubsub_topic" "this" {
  name         = var.topic
  kms_key_name = google_kms_crypto_key.this.id

  depends_on = [
    google_project_iam_member.this,
    google_kms_crypto_key.this
  ]
}
