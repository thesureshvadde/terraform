resource "aws_instance" "roboshop" {
  count = 10
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "Roboshop"
  }
}