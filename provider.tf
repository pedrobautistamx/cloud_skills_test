provider "google" {
  credentials = file("C:/Terraform_credentials/graphite-argon-393800-cd3bdcbde5a2.json")
  project     = "graphite-argon-393800"
  region      = "us-central1"
}