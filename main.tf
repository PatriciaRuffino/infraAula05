provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "ruffino_ec2" {
   
  ami           = "ami-04b3c23ec8efcc2d6"
  instance_type = "t2.micro"
  key_name      = "ruffino-terraform-aws"
  tags = {
    "Name" = "ruffino-ec2"
  }
}

resource "aws_key_pair" "chave_terraform_aws" {
  key_name   = "ruffino-terraform-aws"
  public_key = file("terraform-aws.pub")
}
output "instancia_ec2" {
  value = aws_instance.ruffino_ec2.public_ip
}