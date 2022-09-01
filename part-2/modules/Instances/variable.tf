variable "vpc_id" {
  type = string
  description = "vpc id for instance"
}

variable "subnet_id" {
  type = list
  description = "subnet id for instance"
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
  description = "Tags to attach to VPC resources"
}

variable "key_name" {
  type = string
  description = "aws keypair name"
}

variable "instance_type" {
  type = string
  description = "aws instance type"
  default = "t2.micro"
}

variable "ami_id" {
  type = string
  description = "aws ami id"
  default = "ami-052efd3df9dad4825"
}

variable "associate_public_ip_address" {
  type = bool
  default = true
}