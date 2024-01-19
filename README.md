# homelab-tf

Modular Terraform to manage Docker containers for a homelab environment using Git and local/on-premises hardware.

## Overview

Each subfolder under `hosts` represents a separate physical or virtual host machine upon which one or more Docker containers should be run.

Each subfolder under `modules` represents a separate Docker container to be run on one or more of the hosts above.

The defaults specified in the `variables.tf` of each module reflect the examples in documentation, and should be customized with a `variables.tf` within the subfolder under `hosts`.

To keep secrets out of the repo, we're using `hosts/*/variables.tf` in `.gitignore`.  The contents of these host-specific `variables.tf` files can be stored in a vault or password manager.  An example (`variables.tf.example`) has been provided with reasonable defaults, so feel free to start with that as a template.

## Container and Port Assignments

### Host: 00001

| TCP   | UDP  | Allocation       | Host Variable Declaration        |
|-------|------|------------------|----------------------------------|
| 443   | -    | swag             | `swag_external_port`             |
| -     | 1194 | openvpn          | `openvpn_external_port`          |
| 8096  | -    | jellyfin         | `jellyfin_external_port`         |
| 8123  | -    | homeassistant    | `homeassistant_external_port`    |
| 8888  | -    | nextcloud        | `nextcloud_external_port`        |
| 23001 | -    | dokuwiki         | `dokuwiki_external_port`         |
| 23002 | -    | freshrss         | `freshrss_external_port`         |
| 23004 | -    | postgres-grafana | `postgres_grafana_external_port` |
| 23005 | -    | grafana          | `grafana_external_port`          |
| 23006 | -    | duplicati        | `duplicati_external_port`        |
| 23007 | -    | dashy            | `dashy_external_port`            |
| 23009 | -    | tautulli         | `tautulli_external_port`         |
| 23010 | -    | sickgear         | `sickgear_external_port`         |

### Host: 00002

| TCP   | UDP | Allocation | Host Variable Declaration  |
|-------|-----|------------|----------------------------|
| 53    | 53  | pihole     | `pihole_external_port_dns` |
| 23003 | -   | pihole     | `pihole_external_port_web` |

### Host: 00003

| TCP   | UDP | Allocation | Host Variable Declaration  |
|-------|-----|------------|----------------------------|
| 53    | 53  | pihole     | `pihole_external_port_dns` |
| 23003 | -   | pihole     | `pihole_external_port_web` |

## Requirements

* [Docker >= 20.10.5+dfsg1](https://docs.docker.com/engine/install/)
* [Git >= 2.30.3](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Terraform >= v1.4.6](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Optional:

* [ZFS](https://openzfs.org/wiki/Main_Page)

## Preparation

If using ZFS, build a filesystem to mount volumes within; for example:

    sudo zfs create -p -o "atime=off" -o "devices=off" \
    -o "compression=zstd" -o "xattr=sa" -o "dnodesize=auto" \
    -o "mountpoint=/srv/docker/swag" pool/swag

After adding a module, or in a fresh repo, remember to run `terraform init` to build parts of the backend such as the terraform lock, state, and backup state files.

Configure crontab to apply `terraform` at boot; for example:

    # Terraform
    @reboot cd /git/projects/kso512/homelab-tf/hosts/00001 ; terraform apply -auto-approve -no-color -compact-warnings&

## References

### Provisioner

* Docker provisioner for Terraform
  * [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)
  * [docker_container / Nested Schema for upload](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--upload)

### Modules

* [Dashy](https://github.com/Lissy93/dashy)
  * Source: [lissy93/dashy](https://hub.docker.com/r/lissy93/dashy)
* [Dokuwiki](https://www.dokuwiki.org/dokuwiki/)
  * Source: [linuxserver/dokuwiki](https://hub.docker.com/r/linuxserver/dokuwiki/#!)
* [Duplicati](https://duplicati.com/)
  * Source: [linuxserver/duplicati](https://hub.docker.com/r/linuxserver/duplicati/#!)
* [FreshRSS](https://freshrss.org/)
  * Source: [linuxserver/freshrss](https://hub.docker.com/r/linuxserver/freshrss/#!)
* [Grafana](https://grafana.com/docs/grafana/latest/setup-grafana/configure-docker/)
  * Source: [grafana/grafana-oss](https://hub.docker.com/r/grafana/grafana-oss/#!)
  * Depends on PostgreSQL
* [Home Assistant](https://www.home-assistant.io/installation/linux#platform-installation)
  * Source: [home-assistant/core](https://github.com/home-assistant/core/pkgs/container/home-assistant)
* [Jellyfin](https://jellyfin.org/docs/general/installation/container#docker)
  * Source: [jellyfin/jellyfin](https://hub.docker.com/r/jellyfin/jellyfin/)
* [Nextcloud](https://docs.nextcloud.com/)
  * Source: [linuxserver/nextcloud](https://hub.docker.com/r/linuxserver/nextcloud)
  * Depends on Swag
* [OpenVPN](https://openvpn.net/community-resources/)
  * Source: [kylemanna/openvpn](https://hub.docker.com/r/kylemanna/openvpn/)
  * The instructions above give separate `docker` commands to generate keys, to allow for interaction.  We won't try to emulate that here; instead, use those commands (or others) to generate the required public/private key pair, either within the container or copied over from another.  Name them `${site_name}.key` and `${site_name}.crt`; for example `example.com.key` & `example.com.crt`.
* [pihole](https://pi-hole.net/)
  * Source: [pihole/pihole](https://hub.docker.com/r/pihole/pihole)
* [Plex](https://www.plex.tv/)
  * Source: [linuxserver/plex](https://hub.docker.com/r/linuxserver/plex)
* [PostgreSQL](https://www.postgresql.org/)
  * Source: [postgres](https://hub.docker.com/_/postgres)
* [Sickgear](https://github.com/sickgear/sickgear)
  * Source: [linuxserver/sickgear](https://hub.docker.com/r/linuxserver/sickgear)
* [Swag](https://docs.linuxserver.io/general/swag/)
  * Source: [linuxserver/docker-swag](https://hub.docker.com/r/linuxserver/swag)
  * [Nextcloud subdomain reverse proxy example](https://docs.linuxserver.io/general/swag/#nextcloud-subdomain-reverse-proxy-example)
* [Tautulli](https://tautulli.com/)
  * Source: [linuxserver/docker-tautulli](https://hub.docker.com/r/linuxserver/tautulli)
