# This variables file defines certain environmental
# values related to where the server profile will be
# deployed for this example

variable "local_ntp_server" {
  description = "NTP Server - Terraform deployed"
  type        = string
  default     = "us.pool.ntp.org"
}

variable "local_time_zone" {
  description = "Time Zone - Terraform deployed"
  type        = string
  default     = "America/New_York"
}

variable "ipv4_dns_server_1" {
  description = "IPv4 DNS Server - Terraform deployed"
  type        = string
  default     = "208.67.222.222"
}

variable "ipv4_dns_server_2" {
  description = "IPv4 DNS Server 2 - Terraform deployed"
  type        = string
  default     = "208.67.220.220"
}

variable "site1_syslog_server" {
  description = "Site 1 Syslog Server - Terraform deployed"
  type        = string
  default     = "10.60.180.185"
}

variable "dcnm_password" {
  description = "Password for the local DCNM user"
  type        = string
  default     = "CHANGEME"
}

variable "target_org_moid" {
  description = "MOID of the Target Organization for this profile and policies"
  type        = string
}
