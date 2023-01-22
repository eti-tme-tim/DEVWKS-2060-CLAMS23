locals {
  standalone_moid = data.intersight_asset_device_registration.standalone.results[0].moid
}

data "intersight_asset_device_registration" "standalone" {
  device_hostname = var.standalone_server_name
}

output "standalone_moid" {
  value = local.standalone_moid
}
