output "crypto_key_id_us" {
  value = google_kms_crypto_key.common_us.id
}

output "crypto_key_id_us_central" {
  value = google_kms_crypto_key.common_us_central.id
}

output "project_number" {
  value = data.google_project.common.number
}

output "disk_name" {
  value = google_compute_disk.common.name
}