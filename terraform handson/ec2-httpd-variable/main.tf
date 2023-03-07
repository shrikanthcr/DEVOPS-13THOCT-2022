resource "aws_instance" "ec2terrafrom" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "pemkey"
  user_data     = file("httpd.sh")
  security_groups = ["ASG"]
  count = 1
  tags ={
  Name = "terraform"
  }
}