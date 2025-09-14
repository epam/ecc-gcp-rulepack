resource "google_secret_manager_secret" "this" {
  secret_id = module.naming.resource_prefix.secret

  replication {
    auto {}
  }
}