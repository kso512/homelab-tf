terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "tautulli" {
  name         = "lscr.io/linuxserver/tautulli:${var.tautulli_version}"
  keep_locally = false
}

resource "docker_container" "tautulli" {
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.tautulli.image_id
  name  = "${var.container_name}"
  ports {
    internal = 8181
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
}
