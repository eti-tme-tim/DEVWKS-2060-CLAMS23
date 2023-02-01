# IPMI over LAN
resource "intersight_ipmioverlan_policy" "ipmi_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "IPMI over LAN disabled - Terraform deployed"
  name        = "IPMI-Disabled"

  # COMMENT OUT OR DELETE THE FOLLOWING LINE WHEN YOU ARE READY TO CONFIGURE THIS RESOURCE
  count = 0

  # ADD THE KEY/VALUE PAIRS BELOW

}
