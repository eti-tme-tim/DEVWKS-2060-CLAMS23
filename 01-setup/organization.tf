data "intersight_organization_organization" "default" {
    name = var.target_organization
}

output "org_default_moid" {
    value = data.intersight_organization_organization.default.moid
}
