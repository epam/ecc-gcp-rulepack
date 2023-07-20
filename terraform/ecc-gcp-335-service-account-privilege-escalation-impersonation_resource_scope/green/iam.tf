resource "google_service_account" "member1" {
  account_id   = "service-account-id-335-green"
  display_name = "service-account-335-green"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.member1.name
  role               = "roles/viewer"

  members = [
    "serviceAccount:${google_service_account.member2.account_id}@${var.project}.iam.gserviceaccount.com",
  ]
}

resource "google_service_account" "member2" {
  account_id   = "service-accountactas-335-green"
  display_name = "actas-service-account-335-green"
}
