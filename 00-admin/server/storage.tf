# Define the Storage Policy
resource "intersight_storage_storage_policy" "standalone_storage" {
  organization {
    moid = var.target_org_moid
  }

  description              = "Terraform deployed"
  name                     = "Standalone_Storage_Policy"
  use_jbod_for_vd_creation = true

  unused_disks_state = "UnconfiguredGood"
  global_hot_spares  = ""

  profiles {
    object_type = "server.Profile"
    moid        = intersight_server_profile.standalone.moid
  }
}

output "storage_policy_moid" {
  value = intersight_storage_storage_policy.standalone_storage.moid
}

# Define the Storage Drive Group
resource "intersight_storage_drive_group" "single_raid6_volume" {
  name       = "1vol_12slot_raid6"
  raid_level = "Raid6"

  manual_drive_group {
    span_groups {
      slots = "1,2,3,4,5,6,7,8,9,10,11,12"
    }
  }

  virtual_drives {
    name                = "LOCAL_RAID6"
    size                = 0
    expand_to_available = true
    boot_drive          = true

    virtual_drive_policy {
      access_policy = "ReadWrite"
      drive_cache   = "Enable"
      strip_size    = 64
      read_policy   = "Default"
      write_policy  = "Default"
    }
  }

  # Map this configuration to the following storage policies
  storage_policy {
    moid = intersight_storage_storage_policy.standalone_storage.moid
  }
}

output "storage_disk_group_moid" {
  value = intersight_storage_drive_group.single_raid6_volume.moid
}
