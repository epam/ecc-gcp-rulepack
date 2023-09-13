resource "google_redis_instance" "this" {
  name           = "mrr-memory-cache-${var.prefix}"
  display_name   = "memory-cache-db-${var.prefix}"
  tier           = "BASIC"
  memory_size_gb = 1
}
