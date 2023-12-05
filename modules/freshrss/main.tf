terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "freshrss" {
  name         = "lscr.io/linuxserver/freshrss:${var.freshrss_version}"
  keep_locally = false
}

resource "docker_container" "freshrss" {
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.freshrss.image_id
  name  = "${var.container_name}"
  ports {
    internal = 80
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
}
