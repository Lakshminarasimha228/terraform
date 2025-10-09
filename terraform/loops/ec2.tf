resource "aws_instance" "roboshop" {
    count = 4
  ami           = var.ami_id # left and right side names no need to be same
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags ={
    Name = var.instances[count.index]
  }
}

resource "aws_security_group" "allow_all" {
    description = var.sg_description # string


    ingress {
        from_port        = var.from_port # this 2 some number because of no brackets
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks  # list 
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port # this 2 some number because of no brackets
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}