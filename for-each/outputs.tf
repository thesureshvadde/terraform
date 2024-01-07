output "public_ip" {
  value = aws_instance.roboshop[*].public_ip
}

