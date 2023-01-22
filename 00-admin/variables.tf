variable "student_email_domain" {
  description = "Email domain for student accounts"
  type        = string
  default     = "broadcaststorm.info"
}

variable "standalone_server_name" {
  description = "Target Name for the Standalone Server"
  type        = list(string)
  default     = ["DARTAGNAN"]
}

variable "shared_organization" {
  description = "Common organization to stored 'shared' policies"
  type        = string
  default     = "DEVWKS-2060"
}

variable "number_of_students" {
  description = "How many students are in the lab?"
  type        = number
  default     = 25
}
