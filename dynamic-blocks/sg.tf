resource "aws_security_group" "roboshop" {
  name = roboshop
  dynamic "ingress" {
    for_each = var.ingress
    content {
        from_port        = ingress.value[from_port]
        to_port          = ingress.value[to_port]
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks
    }
  }
}