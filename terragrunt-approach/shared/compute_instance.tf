resource "google_service_account" "default" {
  account_id   = "terraform"
  display_name = "Terraform for VM Instance"
}

resource "google_compute_firewall" "allow_http" {
  name          = "allow-http"
  network       = google_compute_network.test_vpc.name
  target_tags   = ["allow-http"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
}

resource "google_compute_address" "static_ip" {
  name = "ce-static-ip"
}


resource "google_compute_instance" "test" {
  name         = "test-ce"
  machine_type = var.instance_type
  zone         = data.google_compute_zones.available_zones.names[0]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  tags = ["allow-http"]

  network_interface {
    network    = google_compute_network.test_vpc.name
    subnetwork = google_compute_subnetwork.subnet.name

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }


  metadata_startup_script = "sudo apt install -y apache2"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
