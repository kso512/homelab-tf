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
    source                = "../../modules/jellyfin"
    cache_host_path       = var.jellyfin_cache_host_path
    config_host_path      = var.jellyfin_config_host_path
    container_name        = var.jellyfin_container_name
    external_port         = var.jellyfin_external_port
    jellyfin_version      = var.jellyfin_version
    media1_container_path = var.jellyfin_media1_container_path
    media1_host_path      = var.jellyfin_media1_host_path
    media2_container_path = var.jellyfin_media2_container_path
    media2_host_path      = var.jellyfin_media2_host_path
}

module "nextcloud" {
    source            = "../../modules/nextcloud"
    config_host_path  = var.nextcloud_config_host_path
    container_name    = var.nextcloud_container_name
    data_host_path    = var.nextcloud_data_host_path
    external_port     = var.nextcloud_external_port
    nextcloud_version = var.nextcloud_version
    nfs_host_path     = var.nextcloud_nfs_host_path
    pgid              = var.nextcloud_pgid
    puid              = var.nextcloud_puid
    timezone          = var.timezone
    depends_on = [
      module.swag,
    ]
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

module "pihole" {
    source            = "../../modules/pihole"
    config_host_path  = var.pihole_config_host_path
    container_name    = var.pihole_container_name
    custom_line_00001 = var.pihole_custom_line_00001
    dns_1             = var.pihole_dns_1
    dns_2             = var.pihole_dns_2
    dns_3             = var.pihole_dns_3
    dns_4             = var.pihole_dns_4
    dnsmasq_host_path = var.pihole_dnsmasq_host_path
    external_port_dns = var.pihole_external_port_dns
    external_port_web = var.pihole_external_port_web
    pihole_version    = var.pihole_version
    rev_server_cidr   = var.pihole_rev_server_cidr
    rev_server_domain = var.pihole_rev_server_domain
    rev_server_target = var.pihole_rev_server_target
    timezone          = var.timezone
    webpassword       = var.pihole_webpassword
}

module "swag" {
    source           = "../../modules/swag"
    config_host_path = var.swag_config_host_path
    container_name   = var.swag_container_name
    dnsplugin        = var.swag_dnsplugin
    external_port    = var.swag_external_port
    pgid             = var.swag_pgid
    puid             = var.swag_puid
    subdomains       = var.swag_subdomains
    swag_version     = var.swag_version
    timezone         = var.timezone
    upstream_app     = var.swag_upstream_app
    upstream_port    = var.nextcloud_external_port
    upstream_proto   = var.swag_upstream_proto
    url              = var.swag_url
    validation       = var.swag_validation
}
