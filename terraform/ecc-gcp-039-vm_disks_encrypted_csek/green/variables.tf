variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "name" {
  type = string
}

variable "disk_key" {
  type        = string
  description = "Generate the key yourself. Useful link: https://cloud.google.com/compute/docs/disks/customer-supplied-encryption#rsa-encryption"
}