resource "aws_instance" "ec2-tutorial" {
  ami           = "ami-0bbe9b07c5fe8e86e"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.ec2-instance-key-pair.key_name}"
  security_groups = [
    "${aws_security_group.eddie-tutorial-security-group.name}"
  ]
  user_data = "${file("create_site.sh")}"
  tags = {
    Name = "Eddie - ec2 tutorial"
  }
}

resource "aws_key_pair" "ec2-instance-key-pair" {
  key_name   = "${var.ec2-instance-key-name}"
  public_key = "${file("${var.ec2-public-key-path}")}"
}

resource "aws_security_group" "eddie-tutorial-security-group" {
  name        = "${var.ec2-security-group-name}"
  description = "Allows access to ports 22, 80, 443"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.get_my_ip.body)}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # while terraform shows this as an optional field, it is required
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # while terraform shows this as an optional field, it is required
  }
}

data "http" "get_my_ip" {
  url = "http://ipv4.icanhazip.com"
}