resource "aws_route53_record" "record" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}