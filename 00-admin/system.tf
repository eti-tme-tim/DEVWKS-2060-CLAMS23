#
# Intersight System Defined Entities
# 

locals {
  org_default_moid      = data.intersight_organization_organization.default.results[0].moid
  server_admin_moid     = data.intersight_iam_role.server_administrator.results[0].moid
  ucs_domain_admin_moid = data.intersight_iam_role.ucs_domain_administrator.results[0].moid
  authn_cisco_moid      = data.intersight_iam_idp_reference.authn_cisco_com.results[0].moid
  read_only_moid        = data.intersight_iam_role.read_only.results[0].moid
  default_group_moid    = data.intersight_resource_group.default.results[0].moid
}

data "intersight_organization_organization" "default" {
  name = "default"
}

output "org_default_moid" {
  value = data.intersight_organization_organization.default.results[0].moid
}

data "intersight_iam_idp_reference" "authn_cisco_com" {
  domain_name = "cisco.com"
}

output "authn_cisco_com_moid" {
  value = data.intersight_iam_idp_reference.authn_cisco_com.results[0].moid
}

data "intersight_iam_role" "server_administrator" {
  name = "Server Administrator"
}

output "server_admin_moid" {
  value = data.intersight_iam_role.server_administrator.results[0].moid
}

data "intersight_iam_role" "ucs_domain_administrator" {
  name = "UCS Domain Administrator"
}

output "ucs_domain_admin_moid" {
  value = data.intersight_iam_role.ucs_domain_administrator.results[0].moid
}

data "intersight_iam_role" "read_only" {
  name = "Read-Only"
}

output "read_only_moid" {
  value = data.intersight_iam_role.read_only.results[0].moid
}

data "intersight_resource_group" "default" {
  name = "default"
}

output "default_rg_moid" {
  value = data.intersight_resource_group.default.results[0].moid
}

