terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "openvpn" {
  name         = "openvpn/openvpn-as:${var.openvpn_version}"
  keep_locally = false
}

resource "docker_container" "openvpn" {
  image   = docker_image.openvpn.image_id
  name    = "${var.container_name}"
  restart = "unless-stopped"
  capabilities {
    add = [
      "NET_ADMIN",
      "MKNOD",
      ]
  }
  devices {
    container_path = "/dev/net/tun"
    host_path      = "${var.tun_host_path}"
    permissions    = "rwm"
  }
  ports {
    internal = 443
    external = "${var.tcp_external_port}"
    protocol = "tcp"
  }
  ports {
    internal = 943
    external = "${var.admin_external_port}"
    protocol = "tcp"
  }
  ports {
    internal = 1194
    external = "${var.udp_external_port}"
    protocol = "udp"
  }
  volumes {
    container_path = "/openvpn"
    host_path      = "${var.config_host_path}"
  }
}
