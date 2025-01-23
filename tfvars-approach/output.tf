output "ip_address" {
  value       = google_compute_address.static_ip.address
  description = "Compute Instance IP Address"
}
