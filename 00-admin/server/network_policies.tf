# Common policies between Standalone and Fabric deployments

# /api/v1/vnic/EthAdapterPolicies?$filter=Name%20eq%20VMWare
resource "intersight_vnic_eth_adapter_policy" "ethernet_vmware" {
  organization {
    moid = var.target_org_moid
  }

  description = "Terraform deployed"
  name        = "Ethernet-Adapter-VMware"

  advanced_filter   = false
  geneve_enabled    = false
  interrupt_scaling = false

  vxlan_settings {
    enabled = false
  }

  roce_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  arfs_settings {
    enabled = false
  }

  ptp_settings {
    enabled = false
  }

  # Defaults
  uplink_failback_timeout = 5

  completion_queue_settings {
    nr_count = 2
  }

  interrupt_settings {
    nr_count        = 4
    coalescing_time = 125
    coalescing_type = "MIN"
    mode            = "MSIx"
  }

  rss_settings = false

  rx_queue_settings {
    nr_count  = 1
    ring_size = 512
  }

  tx_queue_settings {
    nr_count  = 1
    ring_size = 256
  }

  tcp_offload_settings {
    large_receive = true
    large_send    = true
    rx_checksum   = true
    tx_checksum   = true
  }
}

resource "intersight_vnic_eth_qos_policy" "best_effort_1500" {
  organization {
    moid = var.target_org_moid
  }

  description    = "Terraform deployed"
  name           = "Best-Effort-MTU1500"
  mtu            = 1500
  rate_limit     = 0
  cos            = 0
  burst          = 10240
  priority       = "Best Effort"
  trust_host_cos = false
}

# Standalone Specific Policies - Uplink trunk definition
resource "intersight_vnic_eth_network_policy" "switchport_trunk_all_native_0" {
  organization {
    moid = var.target_org_moid
  }

  description     = "Terraform deployed"
  name            = "Trunk-Native0"
  target_platform = "Standalone"

  vlan_settings {
    default_vlan = 0
    mode         = "TRUNK"
  }
}

# Define Adapter Configuration policy for standalone
resource "intersight_adapter_config_policy" "standalone_installed_adapters" {
  organization {
    moid = var.target_org_moid
  }

  description = "Terraform deployed"
  name        = "Standalone-Installed-Adapters"

  # First Adapter
  settings {
    slot_id = "MLOM"

    # Ethernet Settings
    eth_settings {
      lldp_enabled = true
    }

    # FC Settings
    fc_settings {
      fip_enabled = false
    }
  }

  # Second Adapter
  settings {
    slot_id = "2"

    # Ethernet Settings
    eth_settings {
      lldp_enabled = true
    }

    # FC Settings
    fc_settings {
      fip_enabled = false
    }
  }

  profiles {
    object_type = "server.Profile"
    moid        = intersight_server_profile.standalone.moid
  }
}
