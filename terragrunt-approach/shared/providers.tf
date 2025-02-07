terraform {
  backend "gcs" {
    bucket = var.bucket
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.17.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}
