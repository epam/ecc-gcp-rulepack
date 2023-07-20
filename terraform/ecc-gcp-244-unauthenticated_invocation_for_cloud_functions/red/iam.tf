resource "google_cloudfunctions_function_iam_binding" "this" {
  cloud_function = google_cloudfunctions_function.this.name
  role           = "roles/cloudfunctions.invoker"

  members = [
    "allUsers",
  ]
}