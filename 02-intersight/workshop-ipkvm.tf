# IP-KVM
resource "intersight_kvm_policy" "kvm_enabled_insecure" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description               = "Terraform deployed"
  name                      = "KVMenabledInsecure"

  # ADD THE KEY/VALUE PAIRS BELOW
}
