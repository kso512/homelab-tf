terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "plex" {
  name         = "lscr.io/linuxserver/plex:${var.plex_version}"
  keep_locally = false
}

resource "docker_container" "plex" {
  env = [
    "PGID=${var.pgid}",
    "PUID=${var.puid}",
    "TZ=${var.timezone}",
    "VERSION=docker",
  ]
  image = docker_image.plex.image_id
  name  = "${var.container_name}"
  restart = "unless-stopped"
  ports {
    internal = 32400
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/media"
    host_path      = "${var.media_host_path}"
  }
}
