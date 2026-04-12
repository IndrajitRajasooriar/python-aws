resource "aws_instance" "main_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.main_sg.id]
  associate_public_ip_address = true
  user_data                   = file("script.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    project     = "python-aws"
    environment = "dev"
  }
}