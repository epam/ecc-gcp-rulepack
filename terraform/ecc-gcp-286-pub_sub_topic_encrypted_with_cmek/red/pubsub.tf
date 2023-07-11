resource "google_pubsub_topic" "this" {
  name = "topic-${var.prefix}"
}
