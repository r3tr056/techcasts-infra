# [START dns_managed_zone]
resource "cloud_dns_managed_zone" "indian-zone" {
  name = "indian-zone"
  dns_name = "in-${random_id.rnd.hex}.com."
  description = "Indian Techcast zone"
  labels = {
    foo = "bar"
  }
}

resource "random_id" "rnd" {
  byte_length = 4
}
# [END dns_managed_zone]

