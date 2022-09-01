# common variables
variable "aws_region" {
  type = string 
  default = "us-west-2"
}

# networking variables
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

# aws instance variables

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