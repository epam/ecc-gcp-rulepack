resource "google_redis_instance" "this" {
  name           = "mrr-memory-cache-300-green"
  display_name   = "memory-cache-db-300-green"
  tier           = "BASIC"
  memory_size_gb = 1
  auth_enabled   = true

  labels = {
    custodiarule     = "ecc-gcp-300-memorystore_for_redis_auth"
    compliancestatus = "green"
  }
}
