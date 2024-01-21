# [START dns_service_discovery]

resource "cloud_dns_managed_zone" "sd-zone" {
  provider = google-beta

  name = "peering-zone"
  dns_name = "services.example.com"
  description = "Example private DNS Service Directory zone"
  visiblity = "private"

  service_directory_config {
    namespace {
      namespace_url = techcast_service_discovery_namespace.default.id
    }
  }
}

resource "techcast_service_discovery_namespace" "default" {
  provider = google-beta

  namespace_id = "default"
  location = "asia-southeast1"
}


# [END dns_service_discovery]