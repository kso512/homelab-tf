terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "digikam" {
  name         = "lscr.io/linuxserver/digikam:${var.digikam_version}"
  keep_locally = false
}

resource "docker_container" "digikam" {
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.digikam.image_id
  name  = "${var.container_name}"
  ports {
    internal = 3001
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  volumes {
    container_path = "/import"
    host_path      = "${var.import_host_path}"
  }
}
