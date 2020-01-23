output "ec2-pub-ip" {
  value = "${aws_instance.ec2-tutorial.public_ip}"
}
