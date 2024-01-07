resource "aws_route53_record" "record" {
  count = length(aws_instance.roboshop)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.roboshop[count.index].private_ip]
}