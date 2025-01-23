resource "google_compute_network" "test_vpc" {
  name = "test-vpc"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "test-subnet"
  region        = var.region
  network       = google_compute_network.test_vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
