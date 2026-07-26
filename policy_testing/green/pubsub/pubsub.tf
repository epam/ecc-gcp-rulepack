resource "google_pubsub_topic" "topic1" {
  name         = module.naming.resource_prefix.pubsub_topic
  kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
}

resource "google_pubsub_topic" "topic2" {
  name         = "${module.naming.resource_prefix.pubsub_topic}2"
  kms_key_name = data.terraform_remote_state.common.outputs.crypto_key_id_us_central
}

resource "google_pubsub_subscription" "this" {
  name  = module.naming.resource_prefix.pubsub_sub
  topic = google_pubsub_topic.topic1.name

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.topic2.id
    max_delivery_attempts = 10
  }
}