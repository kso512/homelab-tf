terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "openvpn" {
  name         = "kylemanna/openvpn:${var.openvpn_version}"
  keep_locally = false
}

resource "docker_container" "openvpn" {
  image = docker_image.openvpn.image_id
  name  = "${var.container_name}"
  capabilities {
    add = [
      "NET_ADMIN",
      ]
  }
  ports {
    internal = 1194
    external = "${var.external_port}"
    protocol = "udp"
  }
  volumes {
    container_path = "/etc/openvpn"
    host_path      = "${var.config_host_path}"
  }
  upload {
    file    = "/etc/openvpn/openvpn.conf"
    content = templatefile("${path.module}/templates/openvpn.conf.tftpl", {
      dns_ip    = var.dns_ip,
      site_name = var.site_name,
      })
  }
}
