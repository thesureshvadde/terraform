resource "aws_instance" "roboshop" {
  for_each = var.instance_names
  ami = var.ami_id
  instance_type = each.value
  tags = {
    Name = each.key
  }
}