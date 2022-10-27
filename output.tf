output "instancia_ec2" {
  value = aws_instance.ruffino_ec2.*.public_ip
}