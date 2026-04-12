resource "aws_security_group" "main_sg" {
  name        = "main_sg"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    project     = "python-aws"
    environment = "dev"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_flask_port" {
  security_group_id = aws_security_group.main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 5000
  ip_protocol       = "tcp"
  to_port           = 5000
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.main_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
