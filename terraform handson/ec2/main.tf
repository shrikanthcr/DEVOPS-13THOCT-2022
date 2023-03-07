resource "aws_instance" "ec2terrafrom" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  count = 1
  tags ={
  Name = "my_terraform"
  }
}