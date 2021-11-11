variable "rgname" {
  type        = string # optional
  description = "Name of the Resource group in which to deploy these resources"
}

variable "location" {
  type        = string # optional
  description = "The Azure Region in which all resources in this example should be created."
}
