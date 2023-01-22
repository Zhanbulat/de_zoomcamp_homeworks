locals {
  data_lake_bucket = "de-zoomcamp"
}

variable "gcp_project_id" {
  description = "Your GCP Project ID"
  type = string
  default = "ardent-course-375307"
}

variable "gcp_credentials_path" {
  description = "GCP credentials path"
  type = string
  default = "/home/zhanbulat/.gc/ardent-course-375307-fa5ca3e67fd8.json"
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "europe-west6"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "ny_taxi_trips"
}
