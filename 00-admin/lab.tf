# Instantiate all the lab accounts

resource "intersight_resource_group" "devwks2060" {
  description = "Terraform Deployed"
  name        = "DEVWKS-2060"
  qualifier   = "Allow-Selectors"

  selectors {
    object_type = "resource.Selector"
    selector    = "/api/v1/asset/DeviceRegistrations?$filter=Moid eq '${local.standalone_moid}'"
  }
}

resource "intersight_organization_organization" "shared" {
  description = "Terraform Deployed"
  name        = var.shared_organization

  resource_groups = [
    {
      moid                  = intersight_resource_group.devwks2060.moid
      object_type           = "resource.Group"
      class_id              = "mo.MoRef"
      additional_properties = ""
      selector              = null
    }
  ]
}

module "student_orgs_and_roles" {
  source = "./student"
  count  = var.number_of_students

  shared_organization_moid = intersight_organization_organization.shared.moid
  read_only_moid           = local.read_only_moid
  student_organization     = "student${count.index + 101}"
  student_email            = "student${count.index + 101}@${var.student_email_domain}"
  server_admin_moid        = local.server_admin_moid
  ucs_domain_admin_moid    = local.ucs_domain_admin_moid
  authn_cisco_moid         = local.authn_cisco_moid
  resource_group_moid      = intersight_resource_group.devwks2060.moid
}

module "server_profile_example" {
  source = "./server"

  target_org_moid     = intersight_organization_organization.shared.moid
}
