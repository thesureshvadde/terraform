variable "ami_id" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t2.micro"
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

variable "instance_name" {
  default = "mongodb"
}

variable "instance_names" {
  type = list
  default = ["mongodb", "mysql", "redis", "rabbitmq", "catalogue", "cart", "user", "shipping", "payment", "web"]
}

variable "zone_id" {
  default = "Z06687332YZVYJQOQH873"
}

variable "domain_name" {
  default = "sureshdevops.online"
}