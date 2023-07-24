# Create  VPC
resource "google_compute_network" "my_vpc_test" {
  name    = var.vpc_name
  project = var.proj_id
}

# Create  Internet gateway
resource "google_compute_global_address" "my_gateway_address" {
  name         = "my-gateway-address"
  purpose      = "VPC_PEERING"
  address_type = "EXTERNAL"
}

resource "google_compute_router" "my_router" {
  name    = var.router_name
  network = google_compute_network.my_vpc_test.name
}

resource "google_compute_router_nat" "my_router_nat" {
  name                               = var.nat_name
  router                             = google_compute_router.my_router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

