resource "google_redis_instance" "this" {
  name                    = "mrr-memory-cache-310-green"
  display_name            = "memory-cache-db-310-green"
  tier                    = "BASIC"
  memory_size_gb          = 1
  transit_encryption_mode = "SERVER_AUTHENTICATION"

  labels = {
    custodiarule     = "ecc-gcp-310-memorystore-intransit-encryption"
    compliancestatus = "green"
  }
}
