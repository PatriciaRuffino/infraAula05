resource "aws_instance" "ruffino_ec2" {
  count         = 2
  ami           = "ami-04b3c23ec8efcc2d6"
  instance_type = "t2.micro"
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2_${count.index}"
  }
}
resource "aws_instance" "ruffino_ec2_ansible" {
  count         = 1
  ami           = "ami-04b3c23ec8efcc2d6"
  instance_type = "t2.micro"
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-ansible${count.index}"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF  
}