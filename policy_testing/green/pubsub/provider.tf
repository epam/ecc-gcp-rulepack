provider "google" {
  project = var.project
  region  = var.region
  default_labels = {
    test = "testing-c7n-policies"
  }
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5"
    }
  }
}