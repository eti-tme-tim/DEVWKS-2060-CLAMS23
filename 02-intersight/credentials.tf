# https://intersight.com/an/settings/api-keys/
## Generate API key to obtain the API Key and PEM file

variable "apikey" {
    description = "API Key for Terraform Demo Account"
    type = string
    default = ""
}

variable "secretkey" {
    description = "Filename (PEM) that provides secret key for Terraform Demo Account"
    type = string
    default = ""
}

variable "endpoint" {
    description = "Intersight API endpoint"
    type = string
    default = "https://intersight.com"
}
