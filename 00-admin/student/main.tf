#
# Resources defined for each student
#

resource "intersight_organization_organization" "student" {
  description = "Terraform Deployed"
  name        = var.student_organization

  resource_groups = [
    {
      moid                  = var.resource_group_moid
      object_type           = "resource.Group"
      class_id              = "mo.MoRef"
      additional_properties = ""
      selector              = null
    }
  ]
}

resource "intersight_iam_permission" "student" {
  description = "Student Role - Terraform Deployed"
  name        = var.student_organization
}

resource "intersight_iam_user" "student" {
  email            = var.student_email
  user_id_or_email = var.student_email

  idpreference {
    moid = var.authn_cisco_moid
  }

  permissions {
    moid = intersight_iam_permission.student.moid
  }
}

resource "intersight_iam_resource_roles" "student" {
  permission {
    object_type = "iam.Permission"
    moid        = intersight_iam_permission.student.moid
  }

  resource {
    object_type = "organization.Organization"
    moid        = intersight_organization_organization.student.moid
  }

  roles = [
    {
      moid                  = var.server_admin_moid
      object_type           = "iam.Role"
      class_id              = "mo.MoRef"
      additional_properties = ""
      selector              = null
    },
    {
      moid                  = var.ucs_domain_admin_moid
      object_type           = "iam.Role"
      class_id              = "mo.MoRef"
      additional_properties = ""
      selector              = null
    }
  ]
}

resource "intersight_iam_resource_roles" "shared" {

  permission {
    object_type = "iam.Permission"
    moid        = intersight_iam_permission.student.moid
  }

  resource {
    object_type = "organization.Organization"
    moid        = var.shared_organization_moid
  }

  roles = [
    {
      moid                  = var.read_only_moid
      object_type           = "iam.Role"
      class_id              = "mo.MoRef"
      additional_properties = ""
      selector              = null
    }
  ]
}
