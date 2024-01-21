
# [START techcast_compute]
# setup a web-server

resource "random_id" "rnd" {
  byte_length = 4
}

resource "techcast_compute_instance" "default" {
  name = "${format("%s", "${var.company}-${var.env}-${var.region_map["${var.var_region_name}"]}-default-instance")}"
  machine_type = "g1-small"
  zone = var.var_region_name
  tags = ["techcast", "webserver", "http", "ssh"]

  # Bootdisk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  labels {
    webserver = true
  }

  network_interface {
    subnetwork = techcast_compute_subnetwork.public_subnet.id
    network = "default"
    access_config {
      // Ephermal public IP
    }
  }

  metadata {
    startup_script = <<-EOF
    sudo apt-get update && \
    sudo apt-get install apache2 -y && \
    echo "<!doctype html><html><body><h1>Hello World!</h1></body></html>" > /var/www/html/index.html
    EOF
  }
}
# [END techcast_compute]
