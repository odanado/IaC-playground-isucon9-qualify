
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = element(var.public_subnets, count.index)

  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    map("Name", format("%s-public-%d", var.name, count.index)),
    map("Type", "public")
  )
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.this.id

  tags = var.tags
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    map("Name", format("%s-public", var.name)),
    map("Type", "public")
  )
}

resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  gateway_id     = aws_internet_gateway.public.id

  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}
