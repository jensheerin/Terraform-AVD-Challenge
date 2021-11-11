variable "rgname" {
  type        = string # optional
  description = "Name of the Resource group in which to deploy these resources"
}

variable "location" {
  type        = string # optional
  description = "The Azure Region in which all resources in this example should be created."
}

variable "workspace" {
type        = string # optional
description = "The Azure Virtual Desktop Workspace name" 
}

variable "hostpool" {
type        = string # optional
description = "The Azure Virtual Desktop Hostpool name"  
}