# Create separate default routes for each subnet
resource "google_compute_route" "subnet_routes" {
  for_each         = google_compute_subnetwork.my_subnets
  name             = "route-${each.key}"
  network          = google_compute_network.my_vpc_test.name
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = google_compute_router.my_router.name
  priority         = 100
  depends_on       = [google_compute_router_nat.my_router_nat]
}