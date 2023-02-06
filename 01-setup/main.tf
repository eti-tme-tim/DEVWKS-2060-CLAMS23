terraform {
    required_version = "~> 1.1.9"
    required_providers {
        intersight = {
        source = "CiscoDevNet/intersight"
        version = "1.0.28"
        }
    }
}

provider "intersight" {
    apikey = var.apikey
    secretkey = var.secretkey
    endpoint = var.endpoint
}
