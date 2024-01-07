variable "ingress" {
  type = list
  default = [
    {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        from_port        = 443
        to_port          = 443
        protocol         = "http"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  ]
}