variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t3.medium" # minimum
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
  default     = 100
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
  default     = "8282"
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

variable "jmx_exporter_version" {
  description = "Deploy jmx exporters for Prometheus as javaagent"
  type        = string
  default     = "0.15.0"
}
