resource "google_pubsub_topic" "this" {
  name = "topic-306-green"
}

resource "google_pubsub_topic_iam_binding" "this" {
  project = google_pubsub_topic.this.project
  topic   = google_pubsub_topic.this.name
  role    = "roles/pubsub.viewer"
  members = [
    "group:Test@test.com",
  ]
}