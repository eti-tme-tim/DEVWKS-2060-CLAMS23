variable "shared_organization_moid" {
  description = "Shared Organization with Common Policies"
  type        = string
}

variable "student_organization" {
  description = "Student Organization - Terraform deployed"
  type        = string
}

variable "student_email" {
  description = "Student Email Address - Terraform deployed"
  type        = string
}

variable "server_admin_moid" {
  description = "MOID of iam.Role object mapped to 'Server Administrator' privileges"
  type        = string
}

variable "ucs_domain_admin_moid" {
  description = "MOID of iam.Role object mapped to 'UCS Domain Administrator' privileges"
  type        = string
}

variable "read_only_moid" {
  description = "MOID of iam.Role object mapped to 'Read-Only' privileges"
  type        = string
}

variable "authn_cisco_moid" {
  description = "MOID of iam.IdpReference object mapped to 'cisco.com' authentication"
  type        = string
}

variable "resource_group_moid" {
  description = "MOID of resource.Group object mapped to the workshop RG"
  type        = string
}
