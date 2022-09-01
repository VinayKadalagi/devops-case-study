
resource "aws_security_group" "zeta_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = merge(
    {
      Name        = "zeta_sg",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_instance" "zeta_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id[0]
  associate_public_ip_address = var.associate_public_ip_address
  security_groups             = [aws_security_group.zeta_sg.id]

  tags = merge(
    {
      Name        = "zeta_host",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}
