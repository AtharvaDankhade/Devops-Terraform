resource aws_key_pair my_key_pair {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")
}

resource aws_default_vpc default {

}

resource aws_security_group my_security_group {
  name        = "${var.env}-infra-app-sg"
  description = "this will add TF generated security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic from anywhere"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }

}

resource "aws_instance" "my_ec2" {
  count           = var.aws_instance_count
  ami             = var.ec2_ami_id
  instance_type   = var.aws_instance_type                                         # var.aws_instance_type
  key_name        = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key_pair]
#   user_data       = file("install_nginx.sh")

  tags = {
    Name = "${var.env}-infra-app-instance-${count.index + 1}"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.aws_root_storage_size
    volume_type = var.volume_type
  }

}