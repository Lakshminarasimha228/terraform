resource "aws_instance" "roboshop" {
    #for_each = var.instances
    for_each = toset(var.instances)
  ami           = var.ami_id # left and right side names no need to be same
  instance_type = "t3.micro" 
  #instance_type = each.value
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  
  tags ={
    Name = each.key
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