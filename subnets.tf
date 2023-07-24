# Create 3 subnets
# Define a list of subnets
locals {
  subnets = [
    {
      name          = "subnet1"
      ip_cidr_range = "10.0.1.0/24"
    },
    {
      name          = "subnet2"
      ip_cidr_range = "10.0.2.0/24"
    },
    {
      name          = "subnet3"
      ip_cidr_range = "10.0.3.0/24"
    },
  ]
}


# Create subnets 
resource "google_compute_subnetwork" "my_subnets" {
  for_each      = { for s in local.subnets : s.name => s }
  name          = each.value.name
  region        = var.region
  ip_cidr_range = each.value.ip_cidr_range
  network       = google_compute_network.my_vpc_test.name
}


