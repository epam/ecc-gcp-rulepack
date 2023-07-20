resource "google_redis_instance" "this" {
  name                    = "mrr-memory-cache-310-red"
  display_name            = "memory-cache-db-310-red"
  tier                    = "BASIC"
  memory_size_gb          = 1
  transit_encryption_mode = "DISABLED"

  labels = {
    custodiarule     = "ecc-gcp-310-memorystore-intransit-encryption"
    compliancestatus = "red"
  }
}
