terraform {
  backend "local" {}  
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region = var.region
  credentials = file(var.gcp_credentials_path)  
}


resource "google_storage_bucket" "data-lake-bucket" {
  name          = "de-zoomcamp_${var.gcp_project_id}" 
  location      = var.region

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30  // days
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.BQ_DATASET
  project    = var.gcp_project_id
  location   = var.region
}
