resource "aws_route_table" "terra_route_table" {
  vpc_id = aws_vpc.terra_vpc.id


  tags = {
    Name = "Terraform Test"
  }
}
resource "aws_route" "terra_default_route" {
  route_table_id         = aws_route_table.terra_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terra_gw.id
}

resource "aws_route_table_association" "terra_asoc" {
  subnet_id      = aws_subnet.terra_subnet.id
  route_table_id = aws_route_table.terra_route_table.id

}