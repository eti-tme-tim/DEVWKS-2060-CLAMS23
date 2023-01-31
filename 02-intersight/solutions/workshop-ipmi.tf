# IPMI over LAN
resource "intersight_ipmioverlan_policy" "ipmi_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "IPMI over LAN disabled - Terraform deployed"
  name        = "IPMI-Disabled"
  enabled     = false
}
