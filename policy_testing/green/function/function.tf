resource "google_cloudfunctions_function" "this" {
  name                         = module.naming.resource_prefix.function
  runtime                      = "python311"
  available_memory_mb          = 128
  trigger_http                 = true
  entry_point                  = "hello_world"
  source_archive_bucket        = google_storage_bucket.this.name
  source_archive_object        = google_storage_bucket_object.this.name
  ingress_settings             = "ALLOW_INTERNAL_ONLY"
  service_account_email        = google_service_account.this.email
  vpc_connector                = google_vpc_access_connector.this.id
  https_trigger_security_level = "SECURE_ALWAYS"
}

resource "google_cloudfunctions_function" "this2" {
  name                  = "${module.naming.resource_prefix.function}2"
  runtime               = "python311"
  available_memory_mb   = 128
  entry_point           = "hello_world"
  source_archive_bucket = google_storage_bucket.this.name
  source_archive_object = google_storage_bucket_object.this.name

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.this.name
  }
}


resource "google_service_account" "this" {
  account_id   = "${module.naming.resource_prefix.sa}-function"
  display_name = "${module.naming.resource_prefix.sa}-function"
}

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.this.account_id}@${var.project}.iam.gserviceaccount.com"
}

resource "google_vpc_access_connector" "this" {
  name          = "${module.naming.resource_prefix.vpc_connector}-fun"
  ip_cidr_range = "10.8.0.0/28"
  network       = "default"
}