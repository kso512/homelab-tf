terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "postgres" {
  name         = "postgres:${var.postgres_version}"
  keep_locally = false
}

resource "docker_container" "postgres" {
  env = [
    "PGDATA=/var/lib/postgresql/data/pgdata",
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_USER=${var.postgres_user}",
  ]
  image   = docker_image.postgres.image_id
  name    = "${var.container_name}"
  restart = "always"
  ports {
    internal = 5432
    external = "${var.external_port}"
    protocol = "tcp"
  }
  volumes {
    container_path = "/var/lib/postgresql/data"
    host_path      = "${var.data_host_path}"
  }
}
