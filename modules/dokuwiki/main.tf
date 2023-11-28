terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "dokuwiki" {
  name         = "lscr.io/linuxserver/dokuwiki:${var.dokuwiki_version}"
  keep_locally = false
}

resource "docker_container" "dokuwiki" {
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
  ]
  image = docker_image.dokuwiki.image_id
  name  = "dokuwiki"
  ports {
    internal = 443
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  upload {
    file    = "/config/dokuwiki/conf/local.php"
    content = templatefile("${path.module}/templates/local.php.tftpl", {
      title = var.title,
      })
  }
}
