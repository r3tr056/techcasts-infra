
# [START techcast_dns_register]
resource "cloud_dns_record_set" "default" {
  name = cloud_dns_managed_zone.default.dns_name
  managed_zone = cloud_dns_managed_zone.default.name
  type = "A"
  ttl = 300
  rrdatas = [
    techcast_compute_instance.default.network_interface.0.access_config.0.nat_ip
  ]
}
# [END techcast_dns_register]