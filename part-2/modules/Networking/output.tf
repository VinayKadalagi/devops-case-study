output "vpc_id" {
  value       = aws_vpc.zeta_vpc.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.zeta_public_subnet[*].id
  description = "public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.zeta_private_subnet[*].id
  description = "private subnet IDs"
}