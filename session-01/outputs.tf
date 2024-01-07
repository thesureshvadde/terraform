output "public_ip" {
  value = aws_instance.web.public_ip
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

output "sg_id" {
  value = aws_security_group.allow_all.id
}