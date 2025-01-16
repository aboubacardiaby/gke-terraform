# Terraform Settings Block
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.42.0"
    }
  }
  backend "gcs" {
    bucket = "transapibuckets001"
    prefix = "dev/gke-cluster-public"
  }
}

# Terraform Provider Block
provider "google" {
  credentials = file("./google.json")
  project     = var.gcp_project
  region      = var.gcp_region1

}