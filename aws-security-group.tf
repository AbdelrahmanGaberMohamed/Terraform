resource "aws_security_group" "terra_security_group" {
  name   = "terra_sg"
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "Terraform Test"
  }
  egress {
    description = "Allow all egress connections"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ingres SSH connections"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.user_ip}"]
  }
  ingress {
    description = "Allow ingres HTTP connections"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.user_ip}"]
  }
}