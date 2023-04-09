resource "aws_instance" "web_server" {
  ami           = "ami-08f13e5792295e1b2"
  instance_type = "t2.micro"
  key_name      = "/Users/ilekic/.ssh/aws_kljuc"
  vpc_security_group_ids = ["${aws_security_group.email_vpc.id}"]
  subnet_id     = aws_subnet.web_server_subnet.id

  tags = {
    Name = "web_server"
  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo apt-get update",
#      "sudo apt-get install -y apache2",
#      "sudo systemctl start apache2"
#    ]
#  }
}

resource "aws_instance" "web_client" {
  ami           = "ami-071096749fda40d3f"
  instance_type = "t2.micro"
  key_name      = "/Users/ilekic/.ssh/aws_kljuc"
  vpc_security_group_ids = ["${aws_security_group.email_vpc.id}"]
  subnet_id     = aws_subnet.web_client_subnet.id

  tags = {
    Name = "web_client"
  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo yum update -y",
#      "sudo yum install -y httpd",
#      "sudo systemctl start httpd"
#    ]
#  }
}
