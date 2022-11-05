output "instancia_ec2" {
  value = aws_instance.ruffino_ec2.*.public_ip
}

output "instancia_ec2_private" {
  value = aws_instance.ruffino_ec2.*.private_ip
}
output "instancia_ec2_ansible" {
  value = aws_instance.ruffino_ec2_ansible.*.public_ip
}