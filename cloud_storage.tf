/******************************************
Cloud Storage Bucket
*****************************************/

# Create a GCP storage bucket

resource "google_storage_bucket" "bucket_test" {
  name     = var.bucket_name
  location = var.bucket_region
}


# Apply a policy to the bucket allowing only read access
resource "google_storage_bucket_iam_binding" "bucket_policy" {
  bucket = google_storage_bucket.bucket_test.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}