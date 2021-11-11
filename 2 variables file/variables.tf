# https://learn.hashicorp.com/tutorials/terraform/variables?in=terraform/configuration-language
variable "rgname" {
default = "avd-rg"
type = string # optional
description = "The name of the Resource group in which to deploy these resources"
}

variable "location" {
default = "eastus"
type        = string # optional
description = "The Azure Region in which all resources in this example should be created."
}
