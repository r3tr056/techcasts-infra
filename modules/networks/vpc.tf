
resource "techcast_compute_network" "vpc" {
  name = "${format("%s", "${var.company}-${var.env}-vpc")}"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
}

# [START dns_private_managed_zone]

resource "cloud_dns_managed_zone" "private-zone" {
  name = "private-zone"
  dns_name = "internal.example.com"
  description = "Internal DNS zone"
  labels = {
    foo = "bar"
  }

  visiblity = "private"

  # Network visiblity config
  private_visiblity_config {
    networks {
      network_url = techcast_compute_network.network-1.id
    }
    networks {
      network_url = techcast_compute_network.network-2.id
    }
  }

  # Forwarding config
  forwarding_config {
    target_name_servers {
      ipv4_address = "172.16.1.10"
    }
    target_name_servers {
      ipv4_address = "172.16.1.20"
    }
  }

  # Private Peering config
  peering_config {
    target_network {
      network_url = techcast_compute_network.target-11.id
    }
  }

  peering_config {
    target_network {
      network_url = techcast_compute_network.source-11.id
    }
  }
}


resource "techcast_compute_subnetwork" "public_subnet" {
  name = "${format("%s", "${var.company}-${var.env}-${var.ragion_map["${var.var_region_name}"]}-pub-net")}"
  ip_cidr_range = var.var_uc1_public_subnet
  region = "${var.var_region_name}"
  network = var.network_self_link
}

resource "techcast_compute_subnetwork" "private_subnet" {
  name = "${fromat("%s", "${var.company}-${var.env}-${var.region_map["${var.var_region_name}"]}-priv-net")}"
  ip_cidr_range = var.var_uc1_private_subnet
  network = var.network_self_link
  region = var.var_region_name
  auto_create_subnetworks = false
}

# Target and Source Private Peering
resource "techcast_compute_network" "target-11" {
  name = "target-11"
  auto_create_subnetworks = false
}

resource "techcast_compute_network" "source-11" {
  name = "source-11"
  auto_create_subnetworks = false
}

# [END dns_private_managed_zone]