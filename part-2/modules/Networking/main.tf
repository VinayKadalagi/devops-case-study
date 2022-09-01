data "aws_availability_zones" "available" {}

resource "aws_vpc" "zeta_vpc" {
  cidr_block = var.cidr

  tags = merge(
    {
      Name        = "zeta_vpc",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "zeta_private_subnet" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.zeta_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(
    {
      Name        = "zeta_private_subnet",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_subnet" "zeta_public_subnet" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.zeta_vpc.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name        = "zeta_public_subnet",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route_table" "private" {
  count = length(var.private_subnets)

  vpc_id = aws_vpc.zeta_vpc.id

  tags = merge(
    {
      Name        = "PrivateRouteTable",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "private" {
  count = length(var.private_subnets)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.zeta_nat_gateway[count.index].id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.zeta_vpc.id

  tags = merge(
    {
      Name        = "PublicRouteTable",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.zeta_igw.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.zeta_private_subnet[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = aws_subnet.zeta_public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "zeta_igw" {
  vpc_id = aws_vpc.zeta_vpc.id

  tags = merge(
    {
      Name        = "zeta_IGW",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_eip" "zeta_nat" {
  count = length(var.private_subnets)
  vpc   = true
}

resource "aws_nat_gateway" "zeta_nat_gateway" {
  count         = length(var.private_subnets)
  allocation_id = aws_eip.zeta_nat[count.index].id
  subnet_id     = aws_subnet.zeta_private_subnet[0].id

  tags = merge(
    {
      Name        = "zeta_nat_gateway",
      Project     = var.customer_name,
      Environment = var.environment
    },
    var.tags
  )
  depends_on = [aws_internet_gateway.zeta_igw]
}
