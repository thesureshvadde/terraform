resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  tags = merge(
    var.common_tags, 
    var.vpc_tags
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igw_tags
    )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.common_tags,
    {
        Name = var.public_subnet_names[count.index]
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.common_tags,
    {
        Name = var.private_subnet_names[count.index]
    }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.common_tags,
    {
        Name = var.database_subnet_names[count.index]
    }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
  depends_on                = [aws_route_table.public]
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
#   subnet_id      = aws_subnet.public[count.index].id
  subnet_id = element(aws_route.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.private_route_table_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
#   subnet_id      = aws_subnet.private[count.index].id
  subnet_id = element(aws_route.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
#   subnet_id      = aws_subnet.database[count.index].id
  subnet_id = element(aws_route.database[*].id, count.index)
  route_table_id = aws_route_table.database.id
}