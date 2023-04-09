provider "aws" {
  region = "eu-central-1"
}

# Elastic IPs
resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id

  tags = {
    Name = "web_server_eip"
  }
}

resource "aws_eip" "web_client_eip" {
  instance = aws_instance.web_client.id

  tags = {
    Name = "web_client_eip"
  }
}
