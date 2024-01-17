module "dashy" {
    source           = "../../modules/dashy"
    city             = var.dashy_city
    config_host_path = var.dashy_config_host_path
    container_name   = var.dashy_container_name
    dashy_version    = var.dashy_version
    description      = var.dashy_description
    external_port    = var.dashy_external_port
    theme            = var.dashy_theme
    title            = var.dashy_title
    units            = var.dashy_units
}

module "dokuwiki" {
    source           = "../../modules/dokuwiki"
    config_host_path = var.dokuwiki_config_host_path
    container_name   = var.dokuwiki_container_name
    dokuwiki_version = var.dokuwiki_version
    external_port    = var.dokuwiki_external_port
    pgid             = var.dokuwiki_pgid
    puid             = var.dokuwiki_puid
    timezone         = var.timezone
    title            = var.dokuwiki_title
}

module "duplicati" {
    source            = "../../modules/duplicati"
    backups_host_path = var.duplicati_backups_host_path
    cli_args          = var.duplicati_cli_args
    config_host_path  = var.duplicati_config_host_path
    container_name    = var.duplicati_container_name
    duplicati_version = var.duplicati_version
    external_port     = var.duplicati_external_port
    pgid              = var.duplicati_pgid
    puid              = var.duplicati_puid
    source_host_path  = var.duplicati_source_host_path
    timezone          = var.timezone
}

module "freshrss" {
    source           = "../../modules/freshrss"
    config_host_path = var.freshrss_config_host_path
    container_name   = var.freshrss_container_name
    freshrss_version = var.freshrss_version
    external_port    = var.freshrss_external_port
    pgid             = var.freshrss_pgid
    puid             = var.freshrss_puid
    timezone         = var.timezone
}

module "grafana" {
    source = "../../modules/grafana"
    config_host_path  = var.grafana_config_host_path
    container_name    = var.grafana_container_name
    external_port     = var.grafana_external_port
    grafana_version   = var.grafana_version
    ini_file          = var.grafana_ini_file
    log_mode          = var.grafana_log_mode
    postgres_host     = var.grafana_postgres_host
    postgres_password = var.grafana_postgres_password
}

module "homeassistant" {
    source                     = "../../modules/homeassistant"
    config_host_path           = var.homeassistant_config_host_path
    container_name             = var.homeassistant_container_name
    device_tracker_01_host     = var.homeassistant_device_tracker_01_host
    device_tracker_01_username = var.homeassistant_device_tracker_01_username
    device_tracker_01_password = var.homeassistant_device_tracker_01_password
    device_tracker_02_host     = var.homeassistant_device_tracker_02_host
    device_tracker_02_username = var.homeassistant_device_tracker_02_username
    device_tracker_02_password = var.homeassistant_device_tracker_02_password
    external_port              = var.homeassistant_external_port
    homeassistant_version      = var.homeassistant_version
    media_player_host          = var.homeassistant_media_player_host
    timezone                   = var.timezone
}

module "jellyfin" {
    source               = "../../modules/jellyfin"
    cache_host_path      = var.jellyfin_cache_host_path
    config_host_path     = var.jellyfin_config_host_path
    container_name       = var.jellyfin_container_name
    external_port        = var.jellyfin_external_port
    jellyfin_version     = var.jellyfin_version
    media_container_path = var.jellyfin_media_container_path
    media_host_path      = var.jellyfin_media_host_path
}

module "openvpn" {
    source           = "../../modules/openvpn"
    config_host_path = var.openvpn_config_host_path
    container_name   = var.openvpn_container_name
    dns_ip           = var.openvpn_dns_ip
    external_port    = var.openvpn_external_port
    site_name        = var.openvpn_site_name
    openvpn_version  = var.openvpn_version
}

module "plex" {
    source           = "../../modules/plex"
    config_host_path = var.plex_config_host_path
    container_name   = var.plex_container_name
    media_host_path  = var.plex_media_host_path
    plex_version     = var.plex_version
    puid             = var.plex_puid
    pgid             = var.plex_pgid
    timezone         = var.timezone
}

module "sickgear" {
    source              = "../../modules/sickgear"
    config_host_path    = var.sickgear_config_host_path
    container_name      = var.sickgear_container_name
    downloads_host_path = var.sickgear_downloads_host_path
    external_port       = var.sickgear_external_port
    pgid                = var.sickgear_pgid
    puid                = var.sickgear_puid
    sickgear_version    = var.sickgear_version
    timezone            = var.timezone
    tv_host_path        = var.sickgear_tv_host_path
}


module "tautulli" {
    source           = "../../modules/tautulli"
    config_host_path = var.tautulli_config_host_path
    container_name   = var.tautulli_container_name
    external_port    = var.tautulli_external_port
    pgid             = var.tautulli_pgid
    puid             = var.tautulli_puid
    tautulli_version = var.tautulli_version
    timezone         = var.timezone
}
