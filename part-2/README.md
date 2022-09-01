## Create a Two tier application infrastructure any cloud provider (Preferably in AWS) using Terraform, components that should be included are mentioned below
- VPC 
- Security Group
- Subnet (Public and Private)
- NAT (Instance or service)
- EC2 instance 
- Terraform should use modules for reusability


## Pre-requisite:
1. Make sure keypair is created in aws account in respective region.

## Networking module
Hosts terraform code to deploy:
- VPC 
- Private and Public subnets
- Route table
- IGW and NAT gateway

## Instance module
Hosts terraform code to deploy:
- AWS instance
- Security group
## Usage:
- terraform init
- terraform plan
- terraform apply