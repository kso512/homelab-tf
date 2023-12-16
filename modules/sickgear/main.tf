terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "sickgear" {
  name         = "lscr.io/linuxserver/sickgear:${var.sickgear_version}"
  keep_locally = false
}

resource "docker_container" "sickgear" {
  env = [
    "PGID=${var.pgid}",
    "PUID=${var.puid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.sickgear.image_id
  name  = "${var.container_name}"
  restart = "unless-stopped"
  ports {
    internal = 8081
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/tv"
    host_path      = "${var.tv_host_path}"
  }
  volumes {
    container_path = "/downloads"
    host_path      = "${var.downloads_host_path}"
  }
}
