terraform {
    required_version = "~>1.3.7"

    required_providers {
      intersight = {
          source = "CiscoDevNet/intersight"
          version = ">=1.0.35"
      }
    }
}
