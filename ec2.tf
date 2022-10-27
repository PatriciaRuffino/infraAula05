resource "aws_instance" "ruffino_ec2" {
  count         = 2 
  ami           = "ami-04b3c23ec8efcc2d6"
  instance_type = "t2.micro"
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2_${count.index}"
  }
   user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y \
    ca-certificates -y \
    curl -y \
    gnupg -y \
    lsb-release -y
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
    
  EOF
}