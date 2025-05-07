resource "google_redis_instance" "this" {
  name                    = module.naming.resource_prefix.redis
  display_name            = module.naming.resource_prefix.redis
  tier                    = "BASIC"
  memory_size_gb          = 1
  auth_enabled            = false
  transit_encryption_mode = "DISABLED"
}