provider "google" {
  project = var.project 
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name 
  location = var.location 

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.pool_name 
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count 

  node_config {
    preemptible  = true
    machine_type = var.type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}