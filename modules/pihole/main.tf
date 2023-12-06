terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "pihole" {
  name         = "pihole/pihole:${var.pihole_version}"
  keep_locally = false
}

resource "docker_container" "pihole" {
  image   = docker_image.pihole.image_id
  name    = "${var.container_name}"
  restart = "unless-stopped"
  env = [
    "TZ=${var.timezone}",
    "DNSMASQ_LISTENING=all", 
  ]
  ports {
    internal = 53
    external = "${var.external_port_dns}"
    protocol = "tcp"
  }
  ports {
    internal = 53
    external = "${var.external_port_dns}"
    protocol = "udp"
  }
  ports {
    internal = 80
    external = "${var.external_port_web}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/etc/pihole"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/etc/dnsmasq.d"
    host_path      = "${var.dnsmasq_host_path}"
  }
  upload {
    file    = "/etc/pihole/setupVars.conf"
    content = templatefile("${path.module}/templates/setupVars.conf.tftpl", {
      dns_1             = var.dns_1,
      dns_2             = var.dns_2,
      dns_3             = var.dns_3,
      dns_4             = var.dns_4,
      rev_server_cidr   = var.rev_server_cidr,
      rev_server_domain = var.rev_server_domain,
      rev_server_target = var.rev_server_target,
      webpassword       = var.webpassword,
      })
  }
  upload {
    file    = "/etc/pihole/custom.list"
    content = templatefile("${path.module}/templates/custom.list.tftpl", {
      custom_line_00001 = var.custom_line_00001,
      })
  }
}
