resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_name == "mongodb" ? "t3.medium" : "t2.micro"
  security_groups = [aws_security_group.allow_all.name]

  tags = {
    Name = "HelloWorld"
  }
}