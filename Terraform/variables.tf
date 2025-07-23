variable "project_id" {
  default     = "sunny_project"
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  default     = "us-central1"
  description = "GCP region"
  type        = string
}

variable "zone" {
  default     = "us-central1-a"
  description = "GCP zone"
  type        = string
}

variable "bucket_name" {
  default     = "cap_bucket"
  description = "Cloud Storage bucket name"
  type        = string
}

variable "dataset_id" {
  default     = "cap_dataset"
  description = "BigQuery Dataset ID"
  type        = string
}

variable "table_id" {
  default     = "drivers"
  description = "BigQuery Table ID"
  type        = string
}

variable "vm_name" {
  default     = "cap-vm"
  description = "Name of the VM instance"
  type        = string
}
