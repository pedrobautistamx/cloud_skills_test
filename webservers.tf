locals {
  web_servers = [
    {
      name         = "web-server-1"
      machine_type = "n1-standard-1"
      zone         = "us-central1-a"
      subnet       = "subnet1"
    },
    {
      name         = "web-server-2"
      machine_type = "n1-standard-1"
      zone         = "us-central1-b"
      subnet       = "subnet2"
    },
    {
      name         = "db-server-1"
      machine_type = "n1-standard-1"
      zone         = "us-central1-c"
      subnet       = "subnet3"
    },
  ]
}


# Create web servers using for_each loop
resource "google_compute_instance" "my_servers" {
  for_each     = { for s in local.web_servers : s.name => s }
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network    = google_compute_network.my_vpc_test.name
    subnetwork = each.value.subnet
  }
}

