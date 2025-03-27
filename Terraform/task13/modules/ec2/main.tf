resource "aws_instance" "bastion" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  key_name               = "mikitaKEY"
  vpc_security_group_ids = [var.bastion_sg_id]
  tags = { Name = "Bastion-Host" }
}

resource "aws_instance" "private" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id]
  tags = { Name = "Private-Server" }
}