resource "google_service_account" "member1" {
  account_id   = "service-account-id-335-red"
  display_name = "service-account-335-red"
}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.member1.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${google_service_account.member2.account_id}@${var.project}.iam.gserviceaccount.com",
  ]
}

resource "google_service_account" "member2" {
  account_id   = "service-accountactas-335-re"
  display_name = "actas-service-account-335-red"
}
