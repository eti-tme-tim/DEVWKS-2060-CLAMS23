# IP-KVM
resource "intersight_kvm_policy" "kvm_enabled_insecure" {
  organization {
    object_type = "organization.Organization"
    moid        = local.target_org_moid
  }

  description               = "Terraform deployed"
  name                      = "KVMenabledInsecure"
  enabled                   = true
  maximum_sessions          = 4
  remote_port               = 2069
  enable_video_encryption   = false
  enable_local_server_video = true
}
