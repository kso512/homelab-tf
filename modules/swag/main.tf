terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "swag" {
  name         = "lscr.io/linuxserver/swag:${var.swag_version}"
  keep_locally = false
}

resource "docker_container" "swag" {
  env = [
    "PUID=${var.puid}",
    "PGID=${var.pgid}",
    "TZ=${var.timezone}",
    "URL=${var.url}",
    "VALIDATION=${var.validation}",
    "DNSPLUGIN=${var.dnsplugin}",
    "SUBDOMAINS=${var.subdomains}"
  ]
  image = docker_image.swag.image_id
  name  = "${var.container_name}"
  ports {
    internal = "443"
    external = "${var.external_port}"
    protocol = "tcp"
  }
  restart = "unless-stopped"
  volumes {
    container_path = "/config"
    host_path      = "${var.config_host_path}"
  }
  upload {
    file    = "/config/www/index.html"
    content = templatefile("${path.module}/templates/index.html.tftpl", {
      })
  }
  upload {
    file    = "/config/nginx/proxy-confs/nextcloud.subdomain.conf"
    content = templatefile("${path.module}/templates/nextcloud.subdomain.conf.tftpl", {
      upstream_app   = var.upstream_app,
      upstream_port  = var.upstream_port,
      upstream_proto = var.upstream_proto,
      })
  }
}
