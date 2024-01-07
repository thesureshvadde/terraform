output "private_ip" {
  value = aws_instance.roboshop[*].private_ip
}

output "public_ip" {
  value = aws_instance.roboshop[*].public_ip
}