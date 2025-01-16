# Resource: VPC
resource "google_compute_network" "myvpc" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

# Resource: Subnet
resource "google_compute_subnetwork" "mysubnet" {
  name                     = "${local.name}-${var.gcp_region1}-subnet"
  region                   = var.gcp_region1
  ip_cidr_range            = "10.128.0.0/20"
  network                  = google_compute_network.myvpc.id
  private_ip_google_access = true
}
resource "google_project_iam_member" "network_admin" {
  project = var.gcp_project
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${local.name}-gke-sa"
}