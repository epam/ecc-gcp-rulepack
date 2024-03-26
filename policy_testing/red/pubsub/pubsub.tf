resource "google_pubsub_topic" "this" {
  name = module.naming.resource_prefix.pubsub_topic
}

resource "google_pubsub_subscription" "this" {
  name  = module.naming.resource_prefix.pubsub_sub
  topic = google_pubsub_topic.this.name
}