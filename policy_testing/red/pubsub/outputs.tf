output "pubsub" {
  value = {
    pubsub-topic        = google_pubsub_topic.this.id
    pubsub-subscription = google_pubsub_subscription.this.id
  }
}