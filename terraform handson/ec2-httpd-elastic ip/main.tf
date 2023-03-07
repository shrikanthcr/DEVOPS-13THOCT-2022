provider "aws" {
    region = "us-east-1"
}

#EC2
resource "aws_instance""web" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  security_groups + [aws_security_group.webtraffic.name]
    tags = {
      "Name" = "web-server"
    }
}

#SG
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    # inbound
    ingress {
        description = "Allow inbound https"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #outbound
    egress {
        description = "Allow outbound https"
        form_port = 443
        to_port = 443
        protocal = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# output EIP
output "EIP" {
    value = aws_eip.elasticeip.public_ip
}