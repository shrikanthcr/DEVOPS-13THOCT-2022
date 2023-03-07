resource "aws_instance" "ec2terrafrom" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.medium"
  key_name = "pemkey"
  user_data     = file("nexus.sh")
  security_groups = ["ASG"]
  count = 1
  tags ={
  Name = "terraform-nexus"
  }
}