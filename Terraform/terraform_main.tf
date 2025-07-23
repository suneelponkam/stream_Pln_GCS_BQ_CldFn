provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# VM Instance
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  tags = ["cap-vm"]
}

# GCS Bucket
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
  force_destroy = true
}

# BigQuery Dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  location                    = var.region
  delete_contents_on_destroy = true
}

# BigQuery Table
resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = var.table_id

  schema = jsonencode([
    {
      name = "driver_id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "forename"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "surname"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "dob"
      type = "DATE"
      mode = "NULLABLE"
    },
    {
      name = "nationality"
      type = "STRING"
      mode = "NULLABLE"
    }
  ])
}
