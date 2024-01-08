variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}

variable "enable_dns_support" {
  type = bool
  default = true
}

variable "vpc_tags" {
  type = map
  default = {}
}

variable "common_tags" {
  type = map
  default = {}
}

variable "igw_tags" {
  type = map
  default = {}
}

variable "public_subnet_cidr" {
  type = list
  default = []
}

variable "public_subnet_names" {
  type = list
  default = []
}

variable "azs" {
  type = list
  default = []
}

variable "private_subnet_cidr" {
  type = list
  default = []
}

variable "private_subnet_names" {
  type = list
  default = []
}

variable "database_subnet_cidr" {
  type = list
  default = []
}

variable "database_subnet_names" {
  type = list
  default = []
}

variable "public_route_table_tags" {
  type = map
  default = {}
}

variable "private_route_table_tags" {
  type = map
  default = {}
}

variable "database_route_table_tags" {
  type = map
  default = {}
}