resource "aws_key_pair" "terra_key" {
  key_name   = "terra_key"
  public_key = file("~/.ssh/terra_key.pub")
}

resource "aws_instance" "terra_ec2" {
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.Ubuntu_22_04.id
  key_name               = aws_key_pair.terra_key.id
  vpc_security_group_ids = [aws_security_group.terra_security_group.id]
  subnet_id              = aws_subnet.terra_subnet.id
  user_data              = file("aws_userdata.tpl")
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "Terraform Test"
  }
  provisioner "local-exec" {
    command = templatefile("${var.host_os}_ssh_config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu"
      identityfile = "~/.ssh/terra_key"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }
}