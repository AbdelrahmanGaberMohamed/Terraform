resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-north-1a"

  tags = {
    Name = "TEST"
  }
}