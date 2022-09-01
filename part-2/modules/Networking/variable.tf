variable "cidr" {
  type = string
  description = "vpc cidr range"
  default = ""
}

variable "public_subnets" {
  description = "public subnet cidr list"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "private subnets cidr list"
  type        = list(string)
  default     = []
}

variable "customer_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "tags to attach to VPC resources"
}