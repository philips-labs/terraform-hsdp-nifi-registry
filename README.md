<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="500px">

# HSDP NiFi-Registry module

Module to create an Apache NiFi Registry deployed
on the HSDP Container Host infrastructure. This module serves as a 
blueprint for future HSDP Container Host modules. Example usage

```hcl
module "nifi-registry" {
  source = "github.com/philips-labs/terraform-hsdp-nifi-registry"

  bastion_host         = "bastion.host"
  user                 = "ronswanson"
  private_key          = file("~/.ssh/dec.key")
  user_groups          = ["ronswanson", "poc"]
  docker_image         = "apache/nifi"
  db_name              = "nifi_registry"
  db_host              = "mysql-89e1a78a-056c-123a-ab22-1eafbcaf15831.cbgfzxcdfeyky.us-east-1.rds.amazonaws.com:3306"
  db_username          = "user_test"
  db_password          = "EISIE6UShuyahjAA3OOJatoUCH1THO6A"
  s3_bucket            = "cf-s3-b6af10b4-30e1-4706-a3a4-115c683fadc4"
  s3_access_key        = "AKIAX4PAD7889DGUEAFOZA"
  s3_secret_access_key = "OOXEasHAD3df6CHE6POOJ7OG7fg546THIW5CE7AEZO3"
  s3_region            = "us-east-1"
}
```
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| hsdp | >= 0.13.5 |
| random | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| hsdp | >= 0.13.5 |
| random | >= 2.2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion\_host | Bastion host to use for SSH connections | `string` | n/a | yes |
| docker_image | The docker image to use | `string` | n/a | yes |
| docker_username | The docker registry username | `string` | n/a | no |
| docker_password | The docker registry password | `string` | n/a | no |
| docker_registry | The docker registry host | `string` | n/a | no |
| instance\_type | The instance type to use | `string` | `"t3.small"` | no |
| iops | IOPS to provision for EBS storage | `number` | `500` | no |
| private\_key | Private key for SSH access | `string` | n/a | yes |
| user | LDAP user to use for connections | `string` | n/a | yes |
| user\_groups | User groups to assign to instance | `list(string)` | `[]` | no |
| security\_groups| Cartel security groups to add the instance to | `list(string)` | `["analytics"]` | no |
| volume\_size | The volume size to use in GB | `number` | `5` | no |
| nifi\_registry\_host | The host to be used for nifi-registry | `string` | `0.0.0.0` | no |
| nifi\_registry\_port | The port to be used for nifi-registry | `string` | `8080` | no |
| nifi\_registry\_db\_name | The db name to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_db\_host | The db host to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_db\_username | The db username to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_db\_password | The db password to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_db\_timezone | The db time-zone to be used for nifi-registry | `string` | `UTC` | no |
| nifi\_registry\_db\_max\_connections | The db max connections to be used for nifi-registry | `string` | `6` | no |
| nifi\_registry\_s3\_bucket\_name | The s3 bucket name to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_s3\_access\_key\_id | The s3 access key to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_s3\_secret\_access\_key\_id | The s3 secret access key to be used for nifi-registry | `string` | n/a | yes |
| nifi\_registry\_s3\_bucket\_region | The s3 bucket region to be used for nifi-registry | `string` | n/a | yes |
| host\_name | Nifi host middle name the host name will be `nifi-hostname.dev` | `string` | random number | no |


## Outputs

| Name | Description |
|------|-------------|
| nifi\_registry\_node | Container Host IP addresses of NiFi Registry instances |
| nifi\_registry\_port | Port where you can reach Nifi Registry|
| nifi\_registry\_name\_node | Name of NiFi Registry instance |

# Contact / Getting help

Krishna Prasad Srinivasan <krishna.prasad.srinivasan@philips.com>

# License

License is MIT
