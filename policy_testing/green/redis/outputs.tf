output "redis" {
  value = {
    redis = google_redis_instance.this.id
  }
}