## 
# Variables
##

variable "location" {
    type = string
    default = "uksouth"
}

variable "naming_prefix" {
  type    = string
  default = "terraform"
}

variable "tag_environment" {
  type    = string
  default = "test"
}

variable "tag_owner" {
  type    = string
  default = "jade"
}
