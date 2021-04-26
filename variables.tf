variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t3.small"
}

variable "host_name" {
  type        = string
  default     = ""
  description = "The middle name for your host default is a random number"
}

variable "volume_size" {
  description = "The volume size to use in GB"
  type        = number
  default     = 5
}

variable "iops" {
  description = "IOPS to provision for EBS storage"
  type        = number
  default     = 500
}

variable "user_groups" {
  description = "User groups to assign to cluster"
  type        = list(string)
  default     = []
}

variable "user" {
  description = "LDAP user to use for connections"
  type        = string
}

variable "private_key" {
  description = "Private key for SSH access"
  type        = string
}

variable "bastion_host" {
  description = "Bastion host to use for SSH connections"
  type        = string
}

variable "docker_image" {
  description = "The docker image to use"
  type        = string
}

variable "docker_username" {
  description = "Docker Registry username"
  type        = string
  default     = ""
}

variable "docker_password" {
  description = "Docker Registry password"
  type        = string
  default     = ""
}

variable "docker_registry" {
  description = "Docker Registry host"
  type        = string
  default     = "docker.na1.hsdp.io"
}

variable "security_groups" {
  description = "The security groups attached to the nifi instance."
  type        = list(string)
  default     = ["analytics"]
}

variable "nifi_registry_host" {
  description = "The host to be used for nifi-registry"
  type        = string
  default     = "0.0.0.0"
}

variable "nifi_registry_port" {
  description = "The port to be used for nifi-registry"
  type        = string
  default     = "8080"
}

# Database for NiFi-Registry
variable "nifi_registry_db_name" {
  description = "The db name to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_db_host" {
  description = "The db host to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_db_username" {
  description = "The db username to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_db_password" {
  description = "The db password to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_db_timezone" {
  description = "The db time-zone to be used for nifi-registry"
  type        = string
  default     = "UTC"
}

variable "nifi_registry_db_max_connections" {
  description = "The db max connections to be used for nifi-registry"
  type        = string
  default     = "6"
}

# S3 for NiFi-Registry
variable "nifi_registry_s3_bucket_name" {
  description = "The s3 bucket name to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_s3_access_key_id" {
  description = "The s3 access key to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_s3_secret_access_key_id" {
  description = "The s3 secret access key to be used for nifi-registry"
  type        = string
}

variable "nifi_registry_s3_bucket_region" {
  description = "The s3 bucket region to be used for nifi-registry"
  type        = string
}

# LDAP
//variable "nifi_registry_ldap" {
//  description = "The enable LDAP for Nifi Registry"
//  type        = bool
//  default     = false
//}
//
//variable "nifi_key_store" {
//  type        = string
//  description = "Nifi Key Store needs to be of type JKS"
//}
//
//variable "nifi_key_store_password" {
//  type        = string
//  description = "Nifi Key Store password"
//}
//
//variable "nifi_trust_store" {
//  type        = string
//  description = "Nifi Trust Store needs to be of type JKS"
//}
//
//variable "nifi_trust_store_password" {
//  type        = string
//  description = "Nifi trust Store password"
//}
//
//variable "ldap_dn" {
//  type        = string
//  description = "the DN of the LDAP to be used. for e.g. dn=nifi,dn=com"
//}
//
//variable "ldap_manager" {
//  type        = string
//  description = "the CN and the OU of the account that needs to be used by Nifi-Registry to bind to the LDAP service"
//}
//
//variable "ldap_manager_password" {
//  type        = string
//  description = "the password of the account that needs to be used by Nifi-Registry to bind to the LDAP service"
//}
//
//variable "ldap_port" {
//  type        = string
//  description = "port of the LDAP service"
//}
//
//variable "ldap_groups" {
//  type        = string
//  description = "the LDAP groups to be used for the user search base"
//}
//
//variable "initial_admin_identity" {
//  type        = string
//  description = "the CN and the OU of the account that needs to be used as the admin account by Nifi-Registry"
//}
//
//variable "ldap_conf_file" {
//  type        = string
//  description = "the configuration file for LDAP server to be uploaded to s3"
//}


//"NIFI_REGISTRY_SECURITY_KEYSTORE"         = filebase64(var.NIFI_KEY_STORE)
//"KEYSTORE_TYPE"                           = "JKS"
//"KEYSTORE_PASSWORD"                       = var.NIFI_KEY_STORE_PASSWORD
//"KEY_PASSWORD"                            = var.NIFI_KEY_STORE_PASSWORD
//"NIFI_REGISTRY_SECURITY_TRUSTSTORE"       = filebase64(var.NIFI_TRUST_STORE)
//"TRUSTSTORE_TYPE"                         = "JKS"
//"TRUSTSTORE_PASSWORD"                     = var.NIFI_TRUST_STORE_PASSWORD
//
//"LDAP_AUTHENTICATION_STRATEGY"            = "SIMPLE"
//"LDAP_MANAGER_DN"                         = "${var.LDAP_MANAGER},${var.LDAP_DN}"
//"LDAP_MANAGER_PASSWORD"                   = var.LDAP_MANAGER_PASSWORD
//"LDAP_URL"                                = "ldap://${module.ldap-server.cf_app_endpoint}:${var.LDAP_PORT}"
//"LDAP_USER_SEARCH_BASE"                   = "${var.LDAP_GROUPS},${var.LDAP_DN}"
//"LDAP_GROUP_MEMBER_ATTRIBUTE"             = var.LDAP_DN
//"INITIAL_ADMIN_IDENTITY"                  = "${var.INITIAL_ADMIN_IDENTITY},${var.LDAP_DN}"