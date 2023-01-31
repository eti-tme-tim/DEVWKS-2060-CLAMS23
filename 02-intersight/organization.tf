variable "target_organization" {
  description = "Deployment organization for policies - Terraform deployed"
  type        = string
}

data "intersight_organization_organization" "target" {
    name = var.target_organization
}

output "org_target_moid" {
    value = data.intersight_organization_organization.target.results[0].moid
}

# Local vars for easy reference
locals {
  target_org_moid = data.intersight_organization_organization.target.results[0].moid
}
