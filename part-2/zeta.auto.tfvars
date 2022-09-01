ami_id = "ami-0c2ab3b8efb09f272"
aws_region = "us-west-2"
key_name = "newacc-server"
customer_name = "zeta"
environment = "prod"
associate_public_ip_address = true

cidr = "10.255.245.0/24"
public_subnets = [ "10.255.245.0/25" ]
private_subnets = [ "10.255.245.128/25" ]