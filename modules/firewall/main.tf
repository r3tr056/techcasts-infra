
# [START allow-http]

resource "techcast_compute_firewall" "allow-http" {
  name = "${var.company}-fw-allow-http"
  # http allow rules
  allow {
    ports = ["80"]
    protocol = "tcp"
  }

  direction = "INGRESS"
  network = techcast_compute_network.vpc.id
  priority = 1000
  target_tags = ["http"]
}

# [END allow-http]

# [START allow-ssh]
resource "techcast_compute_firewall" "allow-ssh" {
  name = "${var.company}-fw-allow-ssh"
  network = techcast_compute_network.vpc.id
  direction = "INGRESS"
  priority = 1000
  target_tags = ["ssh"]

  allow {
    ports = ["22"]
    protocol = "tcp"
  }
  
}
# [END allow-ssh]

# [START allow_internal]
resource "techcast_compute_firewall" "allow-internal" {
  name = "${var.company}-fw-allow-internal"
  network = techcast_compute_network.vpc.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }

  source_ranges = [
    "${var.var_asiasoutheast1_private_subnet}",
    "${var.var_asiasoutheast1_public_subnet}"
  ]
}
# [END allow_internal]