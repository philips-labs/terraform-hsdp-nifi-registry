resource "random_id" "id" {
  byte_length = 8
}

resource "hsdp_container_host" "nifi-registry" {
  name          = var.host_name == "" ? "nifi-registry-${random_id.id.hex}.dev" : "nifi-registry-${var.host_name}.dev"
  iops          = var.iops
  volumes       = 1
  volume_size   = var.volume_size
  instance_type = var.instance_type

  user_groups     = var.user_groups
  security_groups = var.security_groups

  lifecycle {
    ignore_changes = [
      volumes,
      volume_size,
      instance_type,
      iops
    ]
  }
}

resource "hsdp_container_host_exec" "instance" {

  triggers = {
    instance_ids = hsdp_container_host.nifi-registry.id
    bash         = file("${path.module}/scripts/bootstrap-nifi-registry.sh.tmpl")
  }

  bastion_host = var.bastion_host
  host         = hsdp_container_host.nifi-registry.private_ip
  user         = var.user
  private_key  = var.private_key

  file {
    content = templatefile("${path.module}/scripts/bootstrap-nifi-registry.sh.tmpl", {
      docker_username      = var.docker_username
      docker_password      = var.docker_password
      docker_image         = var.docker_image
      docker_registry      = var.docker_registry
      port                 = var.nifi_registry_port
      host                 = var.nifi_registry_host
      db_tz                = var.nifi_registry_db_timezone
      db_name              = var.nifi_registry_db_name
      db_host              = var.nifi_registry_db_host
      db_max_conn          = var.nifi_registry_db_max_connections
      db_username          = var.nifi_registry_db_username
      db_password          = var.nifi_registry_db_password
      s3_bucket            = var.nifi_registry_s3_bucket_name
      s3_access_key        = var.nifi_registry_s3_access_key_id
      s3_secret_access_key = var.nifi_registry_s3_secret_access_key_id
      s3_region            = var.nifi_registry_s3_bucket_region
      jmx_exporter_version = var.jmx_exporter_version
    })
    destination = "/home/${var.user}/bootstrap-nifi-registry.sh"
    permissions = "0700"
  }

  commands = [
    "/home/${var.user}/bootstrap-nifi-registry.sh"
  ]
}
