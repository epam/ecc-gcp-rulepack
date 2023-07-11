resource "google_pubsub_topic" "topic1" {
  name = "topic-287-green"
}

resource "google_pubsub_topic" "topic2" {
  name = "topic-dead-letter-287-green"
}

resource "google_pubsub_subscription" "this" {
  name  = "subscription-287-green"
  topic = google_pubsub_topic.topic1.name

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.topic2.id
    max_delivery_attempts = 10
  }

  labels = {
    custodiarule     = "ecc-gcp-287-dead-letter_topic_for_pub_sub_subscription"
    compliancestatus = "green"
  }
}
