# LAN Connectivity policy for VMware Server - Standalone
resource "intersight_vnic_lan_connectivity_policy" "Standalone_VMware" {
  organization {
    moid = var.target_org_moid
  }

  description     = "1:1 mapping of vNIC to external port for MLOM and PCIe Slot 2 - Terraform deployed"
  name            = "Standalone-DirectPorts"
  target_platform = "Standalone"
  placement_mode  = "custom"

  profiles {
    object_type = "server.Profile"
    moid        = intersight_server_profile.standalone.moid
  }
}

# Define the LAN vNICs for standalone - MLOM eth0
resource "intersight_vnic_eth_if" "MLOM_eth0" {
  name  = "eth0"
  order = 0

  placement {
    id       = "MLOM"
    pci_link = 0
    uplink   = 0
  }

  cdn {
    nr_source = "user"
    value     = "VIC-MLOM-eth0"
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.Standalone_VMware.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_vmware.moid
  }

  eth_network_policy {
    moid = intersight_vnic_eth_network_policy.switchport_trunk_all_native_0.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.best_effort_1500.moid
  }

  usnic_settings {
    nr_count = 0
    cos      = 5
  }

  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_sub_vnics       = 64
    num_vmqs            = 4
  }
}

resource "intersight_vnic_eth_if" "MLOM_eth1" {
  name  = "eth1"
  order = 1

  placement {
    id       = "MLOM"
    pci_link = 0
    uplink   = 1
  }

  cdn {
    nr_source = "user"
    value     = "VIC-MLOM-eth1"
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.Standalone_VMware.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_vmware.moid
  }

  eth_network_policy {
    moid = intersight_vnic_eth_network_policy.switchport_trunk_all_native_0.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.best_effort_1500.moid
  }

  usnic_settings {
    nr_count = 0
    cos      = 5
  }

  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_sub_vnics       = 64
    num_vmqs            = 4
  }
}

resource "intersight_vnic_eth_if" "PCI_slot2_eth0" {
  name  = "eth0"
  order = 0

  placement {
    id       = "2"
    pci_link = 0
    uplink   = 0
  }

  cdn {
    nr_source = "user"
    value     = "VIC-2-eth0"
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.Standalone_VMware.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_vmware.moid
  }

  eth_network_policy {
    moid = intersight_vnic_eth_network_policy.switchport_trunk_all_native_0.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.best_effort_1500.moid
  }

  usnic_settings {
    nr_count = 0
    cos      = 5
  }

  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_sub_vnics       = 64
    num_vmqs            = 4
  }
}

resource "intersight_vnic_eth_if" "PCI_slot2_eth1" {
  name  = "eth1"
  order = 1

  placement {
    id       = "2"
    pci_link = 0
    uplink   = 1
  }

  cdn {
    nr_source = "user"
    value     = "VIC-2-eth1"
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.Standalone_VMware.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_vmware.moid
  }

  eth_network_policy {
    moid = intersight_vnic_eth_network_policy.switchport_trunk_all_native_0.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.best_effort_1500.moid
  }

  usnic_settings {
    nr_count = 0
    cos      = 5
  }

  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_sub_vnics       = 64
    num_vmqs            = 4
  }
}
