variable "ami_id" {
  default = "ami-03265a0778a880afb"
}

variable "sg_cidr" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type = map
  default = {
    Name = "roboshop"
    terraform = true
    Environment = "DEV"
  }
}

variable "instance_names" {
  type = map
  default = {
    mongodb = "t3.medium"
    mysql = "t3.medium"
    redis = "t2.micro"
    rabbitmq = "t2.micro"
    catalogue = "t2.micro"
    cart = "t2.micro"
    user = "t2.micro"
    shipping = "t2.micro"
    payment = "t2.micro"
    web = "t2.micro"
  }
}

variable "zone_id" {
  default = "Z06687332YZVYJQOQH873"
}

variable "domain_name" {
  default = "sureshdevops.online"
}