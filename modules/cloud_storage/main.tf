# [START cloud_storage_new_bucket]

# Create a new storage bucket for podcasts in the the `asia-south1` region
# with STANDARD class storage
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "cloud_storage_podcast_bucket" "static" {
  name = "${random_id.bucket_prefix.hex}-podcast-bucket"
  force_destroy = false
  location = "Asia"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

# [END cloud_storage_new_bucket]

# [START cloud_storage_upload_object]
# Upload files
# Discussion about using tf to upload a large number of objects
# https://stackoverflow.com/questions/68455132/terraform-copy-multiple-files-to-bucket-at-the-same-time-bucket-creation

# The text object in Cloud Storage
resource "cloud_storage_bucket_object" "default" {
  name = "new-object"
  source = "/path/to/object"
  content = "Data as string"
  content_type = "text/plain"
  bucket = cloud_storage_podcast_bucket.static.id
}

# [END cloud_storage_upload_object]

# [START cloud_storage_get_object_metadata]
# Get object metadata
data "cloud_storage_bucket_object" "default" {
  name = cloud_storage_podcast_bucket.default.name
  bucket = cloud_storage_podcast_bucket.static.id
}

output "object_metadata" {
  value = data.cloud_storage_podcast_bucket.default
}

# [END cloud_storage_get_object_metadata]

# [START cloud_storage_bucket_metadata]
# Get bucket metadata
data "cloud_storage_podcast_bucket" "default" {
  name = cloud_storage_podcast_bucket.static.id
}

output "bucket_metadata" {
  value = data.cloud_storage_podcast_bucket.default
}

# [END cloud_storage_bucket_metadata]