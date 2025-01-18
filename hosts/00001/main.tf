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
    template         = var.dokuwiki_template
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
    source            = "../../modules/grafana"
    config_host_path  = var.grafana_config_host_path
    container_name    = var.grafana_container_name
    external_port     = var.grafana_external_port
    grafana_version   = var.grafana_version
    ini_file          = var.grafana_ini_file
    log_mode          = var.grafana_log_mode
    postgres_host     = var.grafana_postgres_host
    postgres_name     = var.grafana_postgres_name
    postgres_password = var.grafana_postgres_password
    postgres_user     = var.grafana_postgres_user
    depends_on = [
      module.postgres-grafana,
    ]
}

module "grocy" {
    source           = "../../modules/grocy"
    config_host_path = var.grocy_config_host_path
    container_name   = var.grocy_container_name
    external_port    = var.grocy_external_port
    grocy_version    = var.grocy_version
    pgid             = var.grocy_pgid
    puid             = var.grocy_puid
    timezone         = var.timezone
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
      module.postgres-nextcloud,
    ]
}

module "openvpn" {
    source              = "../../modules/openvpn"
    admin_external_port = var.openvpn_admin_external_port
    config_host_path    = var.openvpn_config_host_path
    container_name      = var.openvpn_container_name
    openvpn_version     = var.openvpn_version
    tcp_external_port   = var.openvpn_tcp_external_port
    tun_host_path       = var.openvpn_tun_host_path
    udp_external_port   = var.openvpn_udp_external_port
}

module "postgres-grafana" {
    source            = "../../modules/postgres"
    container_name    = var.postgres_grafana_container_name
    data_host_path    = var.postgres_grafana_data_host_path
    external_port     = var.postgres_grafana_external_port
    postgres_db       = var.grafana_postgres_name
    postgres_password = var.grafana_postgres_password
    postgres_user     = var.grafana_postgres_user
    postgres_version  = var.postgres_grafana_version
}

module "postgres-nextcloud" {
    source            = "../../modules/postgres"
    container_name    = var.postgres_nextcloud_container_name
    data_host_path    = var.postgres_nextcloud_data_host_path
    external_port     = var.postgres_nextcloud_external_port
    postgres_db       = var.postgres_nextcloud_db
    postgres_password = var.postgres_nextcloud_password
    postgres_user     = var.postgres_nextcloud_user
    postgres_version  = var.postgres_nextcloud_version
}

module "postgres-vikunja" {
    source            = "../../modules/postgres"
    container_name    = var.postgres_vikunja_container_name
    data_host_path    = var.postgres_vikunja_data_host_path
    external_port     = var.postgres_vikunja_external_port
    postgres_db       = var.postgres_vikunja_db
    postgres_password = var.postgres_vikunja_password
    postgres_user     = var.postgres_vikunja_user
    postgres_version  = var.postgres_vikunja_version
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

module "vikunja" {
    source            = "../../modules/vikunja"
    config_host_path  = var.vikunja_config_host_path
    container_name    = var.vikunja_container_name
    database_database = var.vikunja_database_database
    database_host     = var.vikunja_database_host
    database_password = var.vikunja_database_password
    database_type     = var.vikunja_database_type
    database_user     = var.vikunja_database_user
    external_port     = var.vikunja_external_port
    service_jwtsecret = var.vikunja_service_jwtsecret
    service_publicurl = var.vikunja_service_publicurl
    vikunja_version   = var.vikunja_version
    depends_on = [
      module.postgres-vikunja,
    ]
}
