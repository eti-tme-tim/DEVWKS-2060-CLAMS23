# Serial over LAN
resource "intersight_sol_policy" "sol_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "SOL-Disabled"

  # COMMENT OUT OR DELETE THE FOLLOWING LINE WHEN YOU ARE READY TO CONFIGURE THIS RESOURCE
  count = 0

  # ADD THE KEY/VALUE PAIRS BELOW

}
