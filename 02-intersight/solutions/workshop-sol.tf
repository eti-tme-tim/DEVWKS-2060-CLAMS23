# Serial over LAN
resource "intersight_sol_policy" "sol_disabled" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description = "Terraform deployed"
  name        = "SOL-Disabled"
  enabled     = false
}
