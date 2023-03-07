resource "aws_instance" "ec2terrafrom" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  key_name = "pemkey"
  user_data     = file("httpd.sh")
  security_groups = ["ASG"]
  count = 1
  tags ={
  Name = "terraform"
  }
}