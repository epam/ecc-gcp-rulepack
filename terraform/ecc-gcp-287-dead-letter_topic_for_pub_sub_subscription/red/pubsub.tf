resource "google_pubsub_topic" "this" {
  name = "topic-287-red"
}

resource "google_pubsub_subscription" "this" {
  name  = "subscription-287-red"
  topic = google_pubsub_topic.this.name

  labels = {
    custodiarule     = "ecc-gcp-287-dead-letter_topic_for_pub_sub_subscription"
    compliancestatus = "red"
  }
}
