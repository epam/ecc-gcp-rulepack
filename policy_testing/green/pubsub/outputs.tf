output "pubsub" {
  value = {
    pubsub-topic        = google_pubsub_topic.topic1.id
    pubsub-subscription = google_pubsub_subscription.this.id
  }
}